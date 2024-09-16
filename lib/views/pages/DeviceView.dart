import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:http/http.dart' as http;
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/DeviceDefinition.dart';
import 'package:medibound_flutter/helpers/fhir/Observation.dart';
import 'package:medibound_flutter/views/pages/device/DeviceDetailsView.dart';
import 'dart:convert';
import 'package:ticker_text/ticker_text.dart';
import 'package:medibound_flutter/helpers/fhir/Device.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:medibound_flutter/res/Patient.dart';

class DeviceView extends StatefulWidget {
  final Patient mbUser;
  final CupertinoTabController tabController;

  DeviceView({required this.mbUser, required this.tabController});

  @override
  _DeviceViewState createState() => _DeviceViewState(mbUser: this.mbUser, tabController: tabController);
}

class _DeviceViewState extends State<DeviceView> with AutomaticKeepAliveClientMixin {
  final Patient mbUser;
  final CupertinoTabController tabController;
  List<DeviceNotifier> devicesList = [];
  List<Guid> devicesListGuid = [];
  List<DeviceNotifier> filteredDevicesList = [];
  Device? connectedDevice;
  String deviceInfo = '';
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  Map<String, bool> deviceOnlineStatus = {};
  Map<String, double> scales = {};
  List<BluetoothDevice> list = [];
  GoogleCloudService googleCloudService = GoogleCloudService();
  FlutterBluePlus flutterBlue = FlutterBluePlus();
  Set<String> nearbyDeviceUUIDs = {};
  bool isLoading = true;

  _DeviceViewState({required this.mbUser, required this.tabController});

  StreamSubscription<List<BluetoothDevice>>? connectedDevicesSubscription;
  StreamSubscription? scanDevicesSubscription;
  //StreamSubscription<void>? fhirDevicesSubscription;
  Map<String, Observation?> currentObservationMap = {};

  Map<String, BluetoothDevice> uuids = {};

  bool isEditMode = false;
  Set<String> selectedDevices = {};
  @override
  bool get wantKeepAlive => true;


  @override
  void initState() {
    super.initState();
    init();

    /*fhirDevicesSubscription = Stream.periodic(Duration(seconds: 15))
        .asyncMap((_) => fetchDevices())
        .listen((value) => {});*/
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text;
        filterAndSortDevices();
      });
    });
  }

  @override
  void dispose() {
    connectedDevicesSubscription?.cancel();
    //fhirDevicesSubscription?.cancel();
    scanDevicesSubscription?.cancel();
    FlutterBluePlus.stopScan();
    super.dispose();
  }

  

  Future<void> init() async {
    connectedDevicesSubscription?.cancel();
    //fhirDevicesSubscription?.cancel();
    scanDevicesSubscription?.cancel();
    FlutterBluePlus.stopScan();
    await initDevices();
    
  }

  Future<void> initDevices() async {
    FHIRFunctions fhirFunctions = await googleCloudService.init();
    String id = await mbUser.init(fhirFunctions.identityToken);
    List<Device> devices = await fhirFunctions.device.listDevicesForPatient(
      patientReference: 'Patient/' + id, // Replace with your patient reference
    );
    
    setState(() {
      devicesList = devices.map((device) {
        final notifier = DeviceNotifier(device);
        return notifier;
      }).toList();
      deviceOnlineStatus = Map.fromIterable(
        devicesList,
        key: (device) => device.value.id,
        value: (device) => false,
      );
      devicesListGuid = [];
      for (var device in devicesList) {
        devicesListGuid.add(Guid(device.value.id));
        device.setStatus("inactive");
        device.update(fhirFunctions.token);
        print("called");
      }
      scales = Map.fromIterable(
        devicesList,
        key: (device) => device.value.id,
        value: (device) => 1.0,
      );
      filterAndSortDevices();
      isLoading = false;

      
    });
 
    
    

    scanDevicesSubscription = FlutterBluePlus.scanResults.listen((value) {
      for (var scan in value) {
        for (var serviceUUID in scan.advertisementData.serviceUuids) {
          for (var device in devicesList) {
            if (serviceUUID.toString()
                .toLowerCase()
                .contains(device.value.id.toLowerCase())) {
              if (uuids[serviceUUID..toString().toLowerCase()] == null) {
                scan.device.connect().then((value) {
                  print("connected");
                  uuids[serviceUUID.toString().toLowerCase()] = scan.device;
                  setState(() {
                    deviceOnlineStatus[device.value.id.toLowerCase()] = true;
                    device.setStatus("active");
                    device.update(fhirFunctions.token);
                    filterAndSortDevices();
                  });
                });

                scan.device.state.listen((state) {
                  if (state == BluetoothDeviceState.disconnected) {
                    if (mounted) {
                      setState(() {
                        deviceOnlineStatus[device.value.id.toLowerCase()] =
                            false;
                        device.setStatus("inactive");
                        device.update(fhirFunctions.token);
                        uuids.remove(serviceUUID.toString().toLowerCase());
                        filterAndSortDevices();
                      });
                    }
                  }
                });
              }
            }
          }
        }
      }
    });

    FlutterBluePlus.startScan();
  }

  Future<void> fetchDevices() async {
    FHIRFunctions fhirFunctions = await googleCloudService.init();
    String id = await mbUser.init(fhirFunctions.token);
    List<Device> devices = await fhirFunctions.device.listDevicesForPatient(
      patientReference: 'Patient/' + id, // Replace with your patient reference
    );

    if (mounted) {
      setState(()  {
        Map<String, DeviceNotifier> currentDevicesMap = {
          for (var notifier in devicesList) notifier.value.id: notifier
        };

        

        for (var device in devices) {
          if (currentDevicesMap.containsKey(device.id)) {
            currentDevicesMap[device.id]!.value = device;
            currentDevicesMap[device.id]!.notifyListeners();
          } else {
            final notifier = DeviceNotifier(device);
            notifier.addListener(() {
              print('Device changed: ${notifier.value.id}');
            });
            devicesList.add(notifier);
          }
        }

        devicesList.removeWhere((notifier) {
          bool test = !devices.any((device) => device.id == notifier.value.id);
          if (test) {
            notifier.removePatient(fhirFunctions.token);
          }
          return test;
        });

        devicesListGuid = devices.map((device) => Guid(device.id)).toList();
        filterAndSortDevices();
      });
    }
  }

  void filterAndSortDevices() {
    setState(() {
      filteredDevicesList = devicesList
          .where((device) =>
              device.value.displayName.contains(searchQuery) ||
              device.value.id.contains(searchQuery))
          .toList();
      filteredDevicesList.sort((a, b) {
        bool aOnline = deviceOnlineStatus[a.value.id] ?? false;
        bool bOnline = deviceOnlineStatus[b.value.id] ?? false;
        if (aOnline && !bOnline) return -1;
        if (!aOnline && bOnline) return 1;
        return 0;
      });
    });
  }

  void _onTapDown(TapDownDetails details, String deviceId) {
    setState(() {
      scales[deviceId] = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details, String deviceId) {
    setState(() {
      scales[deviceId] = 1.0;
    });
  }

  void _onLongPressDown(LongPressDownDetails details, String deviceId) {
    setState(() {
      scales[deviceId] = 0.95;
    });
  }

  void _onLongPressUp(String deviceId) {
    setState(() {
      scales[deviceId] = 1.0;
    });
  }

  void _showDialog(DeviceNotifier deviceNotifier) {
    FocusScope.of(context).unfocus();
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        decoration: BoxDecoration(
          color: CupertinoTheme.of(context).barBackgroundColor.withOpacity(1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            FocusScope.of(context).unfocus();
            return ValueListenableBuilder<Device>(
              valueListenable: deviceNotifier,
              builder: (context, device, child) {
                if (device.patientReference.isEmpty) {
                  Navigator.pop(context);
                }
                return Container(
                  height: 600,
                  padding: const EdgeInsets.only(top: 6.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      MbColors.darkaccent(context).withOpacity(0.05),
                      MbColors.darkaccent(context).withOpacity(0.01),
                      (device.owner?.color == null
                              ? MbColors.darkaccent(context)
                              : device.owner!.color)!
                          .withOpacity(0.1),
                    ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SafeArea(
                          top: false,
                          child: DeviceDetailsView(
                            deviceKey: ValueKey<Device>(device),
                            tabController: tabController,
                          deviceNotifier: deviceNotifier,
                            mostRecentObservation: currentObservationMap[device.id],
                            mbUser: mbUser,
                            builderContext: context,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
      selectedDevices.clear();
    });
  }

  Future<void> _removeSelectedDevices() async {
    FHIRFunctions fhirFunctions = await googleCloudService.init();
    for (var id in selectedDevices) {
      final notifier =
          devicesList.firstWhere((notifier) => notifier.value.id == id);
      await notifier.removePatient(fhirFunctions.token);
    }
    await fetchDevices();
    _toggleEditMode();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('My Devices'),
            backgroundColor: Colors.transparent,
            border: Border.all(width: 0, color: Colors.transparent),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerRight,
              onPressed: isEditMode ? _removeSelectedDevices : () {},
              child: isEditMode
                  ? Text(
                      "Remove",
                      style: TextStyle(color: CupertinoColors.systemRed),
                    )
                  : Text(
                      "Add Device",
                    ),
            ),
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              onPressed: _toggleEditMode,
              child: Text(isEditMode ? "Cancel" : "Edit",),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverSearchBarDelegate(
              minHeight: 80.0,
              maxHeight: 80.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CupertinoSearchTextField(
                  backgroundColor: CupertinoTheme.of(context)
                        .primaryContrastingColor
                        .withOpacity(0.05),
                  controller: searchController,
                  placeholder: 'Search Devices...',

                ),
              ),
            ),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {

              await fetchDevices();
            },
          ),
          isLoading
              ? SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: CupertinoActivityIndicator(
                            radius: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Adjust the number of columns as needed
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final device = filteredDevicesList[index].value;
                        final scale = scales[device.id] ?? 1.0;
                        final isSelected = selectedDevices.contains(device.id);

                        return GestureDetector(
                          key: ValueKey(device.id),
                          onTap: () => {
                            if (isEditMode)
                              {
                                setState(() {
                                  if (isSelected) {
                                    selectedDevices.remove(device.id);
                                  } else {
                                    selectedDevices.add(device.id);
                                  }
                                })
                              }
                            else
                              {
                                FocusScope.of(context).unfocus(),
                                
                                _showDialog(filteredDevicesList[index])
                              }
                          },
                          onLongPress: () {
                            if (!isEditMode) {
                              _toggleEditMode();
                              setState(() {
                                if (isSelected) {
                                  selectedDevices.remove(device.id);
                                } else {
                                  selectedDevices.add(device.id);
                                }
                              });
                            }
                          },
                          onTapDown: (details) => _onTapDown(details, device.id),
                          onTapUp: (details) => _onTapUp(details, device.id),
                          onLongPressDown: (details) => _onLongPressDown(details, device.id),
                          onLongPressUp: () => _onLongPressUp(device.id),
                          child: Center(
                            child: AnimatedScale(
                              curve: Curves.easeInOut,
                              duration: Duration(milliseconds: 500),
                              scale: scale,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: isSelected
                                      ? Border.all(
                                          color: MbColors.darkaccent(context),
                                          width: 2,
                                        )
                                      : null,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: CupertinoTheme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: CupertinoColors.black.withOpacity(0.07),
                                        spreadRadius: 1,
                                        blurRadius: 20,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: deviceOnlineStatus[
                                                    device.id] ==
                                                true
                                            ? [
                                                Colors.transparent,
                                                Colors.transparent,
                                                (device.owner?.color == null
                                                        ? MbColors.darkaccent(
                                                            context)
                                                        : device
                                                            .owner!.color)!
                                                    .withOpacity(0.05),
                                                (device.owner?.color == null
                                                        ? MbColors.darkaccent(
                                                            context)
                                                        : device
                                                            .owner!.color)!
                                                    .withOpacity(0.1),
                                              ]
                                            : [
                                                Colors.transparent,
                                                Colors.transparent,
                                                CupertinoColors.systemGrey
                                                    .withOpacity(0.04),
                                                CupertinoColors.systemGrey
                                                    .withOpacity(0.07),
                                              ],
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            device.owner?.pictureUrl ==
                                                        null ||
                                                    device.owner!.pictureUrl!
                                                        .isEmpty
                                                ? const Icon(
                                                    CupertinoIcons
                                                        .device_laptop,
                                                    size: 30,
                                                    color: MbColors.greygreen)
                                                : Container(
                                                    foregroundDecoration:
                                                        BoxDecoration(
                                                      color: deviceOnlineStatus[
                                                                  device
                                                                      .id] ==
                                                              true
                                                          ? Colors.transparent
                                                          : Colors.black,
                                                      backgroundBlendMode:
                                                          BlendMode
                                                              .saturation,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                      child: Image.network(
                                                        device.owner!
                                                            .pictureUrl!,
                                                        width: 35,
                                                        height: 35,
                                                      ),
                                                    ),
                                                  ),
                                            Spacer(),
                                            (isEditMode)
                                                ? (isSelected
                                                    ? SizedBox(
                                                        width: 25,
                                                        height: 25,
                                                        child: Container(
                                                          child: Icon(
                                                            CupertinoIcons
                                                                .checkmark_alt,
                                                            size: 14,
                                                            color: MbColors
                                                                .darkaccent(
                                                                    context),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: MbColors
                                                                    .darkgreen(
                                                                        context)
                                                                .withOpacity(
                                                                    0.2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        width: 25,
                                                        height: 25,
                                                        child: Container(
                                                          child: SizedBox(
                                                              width: 0),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: CupertinoTheme.of(
                                                                          context)
                                                                      .primaryContrastingColor
                                                                      .withOpacity(
                                                                          0.1))),
                                                          padding:
                                                              EdgeInsets.zero,
                                                        ),
                                                      ))
                                                : (deviceOnlineStatus[
                                                            device.id] ==
                                                        true
                                                    ? SizedBox(
                                                        width: 25,
                                                        height: 25,
                                                        child:
                                                            CupertinoButton(
                                                          child: Icon(
                                                              CupertinoIcons
                                                                  .play_fill,
                                                              size: 14),
                                                          color: CupertinoTheme
                                                                  .of(context)
                                                              .primaryContrastingColor
                                                              .withOpacity(
                                                                  0.1),
                                                          padding:
                                                              EdgeInsets.zero,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30),
                                                          onPressed: () => {},
                                                        ),
                                                      )
                                                    : SizedBox(width: 0)),
                                          ],
                                        ),
                                        Spacer(),
                                        SizedBox(height: 10),
                                        TickerText(
                                          speed: 30,
                                          endPauseDuration:
                                              Duration(milliseconds: 5000),
                                          startPauseDuration:
                                              Duration(milliseconds: 5000),
                                          returnDuration:
                                              Duration(milliseconds: 3000),
                                          child: Text(
                                            device.displayName.isEmpty
                                                ? 'Unnamed Device'
                                                : device.displayName,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: TickerText(
                                                  speed: 30,
                                                  endPauseDuration: Duration(
                                                      milliseconds: 5000),
                                                  startPauseDuration:
                                                      Duration(
                                                          milliseconds: 5000),
                                                  returnDuration: Duration(
                                                      milliseconds: 3000),
                                                  child: Text(
                                                    device.owner?.name ==
                                                                null ||
                                                            device.owner!
                                                                .name!.isEmpty
                                                        ? 'Unnamed Organization'
                                                        : device.owner!.name,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: CupertinoColors
                                                            .systemGrey),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons
                                                          .circle_fill,
                                                      color: deviceOnlineStatus[
                                                                  device
                                                                      .id] ==
                                                              true
                                                          ? MbColors
                                                              .darkaccent(
                                                                  context)
                                                          : CupertinoColors
                                                              .systemGrey,
                                                      size: 10,
                                                    ),
                                                    SizedBox(width: 2),
                                                    Text(
                                                      deviceOnlineStatus[
                                                                  device
                                                                      .id] ==
                                                              true
                                                          ? "Online"
                                                          : "Offline",
                                                      textAlign:
                                                          TextAlign.end,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: deviceOnlineStatus[
                                                                      device
                                                                          .id] ==
                                                                  true
                                                              ? MbColors
                                                                  .darkaccent(
                                                                      context)
                                                              : CupertinoColors
                                                                  .systemGrey),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ]),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: filteredDevicesList.length,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class _SliverSearchBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverSearchBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverSearchBarDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}
