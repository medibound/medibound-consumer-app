import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/Device.dart';
import 'package:medibound_flutter/helpers/fhir/Observation.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:medibound_flutter/res/Patient.dart';
import 'package:medibound_flutter/ui/DataUI.dart';
import 'package:medibound_flutter/views/pages/observation/ObservationHeader.dart';
import 'package:ticker_text/ticker_text.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

class DeviceDetailsView extends StatefulWidget {
  final ValueNotifier<Device> deviceNotifier;
  final ValueKey<Device> deviceKey;
  final BuildContext builderContext;
  Observation? mostRecentObservation;
  Patient mbUser;
  final CupertinoTabController tabController;

  DeviceDetailsView(
      {required this.deviceKey,
      required this.deviceNotifier,
      required this.mbUser,
      required this.builderContext,
      required this.tabController,
      this.mostRecentObservation});

  @override
  _DeviceDetailsViewState createState() => _DeviceDetailsViewState(
      deviceNotifier: deviceNotifier,
      mbUser: mbUser,
      builderContext: builderContext,
      tabController: tabController);
}

class _DeviceDetailsViewState extends State<DeviceDetailsView> {
  final ValueNotifier<Device> deviceNotifier;
  final ScrollController _controller = ScrollController();
  final CupertinoTabController tabController;
  final BuildContext builderContext;
  Observation? mostRecentObservation;
  GoogleCloudService googleCloudService = GoogleCloudService();
  Patient mbUser;
  bool isLoading = true;
  List<Observation> observations =
      []; // Assume this list is populated with data.

  _DeviceDetailsViewState({
    required this.deviceNotifier,
    required this.builderContext,
    required this.mbUser,
    required this.tabController,
  }) {}

  @override
  void initState() {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    fetchObservations();
  }

  Future<void> fetchObservations() async {
    FHIRFunctions fhirFunctions = await googleCloudService.init();
    String id = await mbUser.init(fhirFunctions.identityToken);
    List<Observation> observationsFinal = await fhirFunctions.observation
        .listObservationsForPatientAndDevice(
            patientReference: 'Patient/' + id,
            deviceReference: "Device/" +
                deviceNotifier.value.id // Replace with your patient reference
            );

    observations = observationsFinal;
    getMostRecentObservations();

    setState(() {
      isLoading = false;
    });
  }

  void getMostRecentObservations() {
    Map<String, List<Observation>> groupedObservations = {};

    for (var observation in observations) {
      String category = observation.observationDefinition!.category['display'];
      if (groupedObservations.containsKey(category)) {
        groupedObservations[category]!.add(observation);
      } else {
        groupedObservations[category] = [observation];
      }
    }

    groupedObservations.forEach((category, observations) {
      observations
          .sort((a, b) => b.effectiveDateTime!.compareTo(a.effectiveDateTime!));
      mostRecentObservation = observations.first;
    });

    print(mostRecentObservation);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 30, left: 30, bottom: 30),
      child: Column(
        children: [
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(CupertinoIcons.chevron_down, color: CupertinoTheme.of(context)
                                        .primaryContrastingColor
                                        .withOpacity(0.2), size: 20),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FadingEdgeScrollView.fromSingleChildScrollView(
              child: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        deviceNotifier.value.owner?.pictureUrl == null ||
                                deviceNotifier.value.owner!.pictureUrl!.isEmpty
                            ? const Icon(CupertinoIcons.device_laptop,
                                size: 30, color: MbColors.greygreen)
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  deviceNotifier.value.owner!.pictureUrl!,
                                  width: 65,
                                  height: 65,
                                ),
                              ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: TickerText(
                                          speed: 30,
                                          endPauseDuration:
                                              Duration(milliseconds: 5000),
                                          startPauseDuration:
                                              Duration(milliseconds: 5000),
                                          returnDuration:
                                              Duration(milliseconds: 3000),
                                          child: Text(
                                            deviceNotifier
                                                    .value.displayName.isEmpty
                                                ? 'Unnamed Device'
                                                : deviceNotifier
                                                    .value.displayName,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: TickerText(
                                        speed: 30,
                                        endPauseDuration:
                                            Duration(milliseconds: 5000),
                                        startPauseDuration:
                                            Duration(milliseconds: 5000),
                                        returnDuration:
                                            Duration(milliseconds: 3000),
                                        child: Text(
                                          "From " +
                                              (deviceNotifier.value.owner
                                                              ?.name ==
                                                          null ||
                                                      deviceNotifier.value
                                                          .owner!.name!.isEmpty
                                                  ? 'Unnamed Organization'
                                                  : deviceNotifier
                                                      .value.owner!.name!),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  CupertinoColors.systemGrey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                ValueListenableBuilder<Device>(
                                  valueListenable: deviceNotifier,
                                  builder: (context, device, child) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              CupertinoIcons.circle_fill,
                                              color: (device.status == "active")
                                                  ? MbColors.darkaccent(context)
                                                  : CupertinoColors.systemGrey,
                                              size: 10,
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              (device.status == "active")
                                                  ? "Online"
                                                  : "Offline",
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: (device.status ==
                                                          "active")
                                                      ? MbColors.darkaccent(
                                                          context)
                                                      : CupertinoColors
                                                          .systemGrey),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Builder(
                      builder: (context) {
                        if (deviceNotifier.value.deviceDefiniton != null) {
                          return Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: CupertinoTheme.of(context)
                                      .primaryContrastingColor
                                      .withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Notes: " +
                                            deviceNotifier.value.deviceDefiniton!.note,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: CupertinoColors.systemGrey,
                                        ),
                                        maxLines: null,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Gallery",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "No Photos Provided",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 14,
                              height: 2),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "My Previous Records",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: isLoading
                              ? Row(
                                mainAxisAlignment:
                                          MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Container(
                                          padding: EdgeInsets.all(16),
                                          child: CupertinoActivityIndicator(
                                              radius: 14))),
                                ],
                              )
                              : Builder(builder: (context) {
                                  if (mostRecentObservation != null) {
                                    return Expanded(
                                        child: Container(
                                            child: ObservationHeader(
                                                observation:
                                                    mostRecentObservation!,
                                                tabController: tabController, onTap: () {
                                                  Navigator.of(builderContext).pop();
                                                  print('working');
                                                },)));
                                  } else {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "No Records Taken",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: CupertinoColors.systemGrey,
                                              fontSize: 14,
                                              height: 2),
                                        ),
                                      ],
                                    );
                                  }
                                }),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Device Information",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Serial Number: " + deviceNotifier.value.serialNumber,
                          style: TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 14,
                              height: 1.5),
                        ),
                        Text(
                          "Part Number: " + deviceNotifier.value.partNumber,
                          style: TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 14,
                              height: 1.5),
                        ),
                        Text(
                          "Id: " + deviceNotifier.value.id,
                          style: TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 14,
                              height: 1.5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          (deviceNotifier.value.status == "active")
              ? FullSecondaryCupertinoButton(
                  backgroundColor: MbColors.darkgreen(context).withOpacity(0.1),
                  opacity: 0.03,
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.play_fill,
                          size: 18, color: MbColors.darkaccent(context)),
                      SizedBox(width: 8),
                      Text(
                        "Run Device",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: MbColors.darkaccent(context)),
                      )
                    ],
                  ),
                  onPressed: () => {})
              : SizedBox(width: 0),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: FullSecondaryCupertinoButton(
                    backgroundColor: CupertinoTheme.of(context)
                        .primaryContrastingColor
                        .withOpacity(0.05),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.gear_solid,
                            size: 18,
                            color: CupertinoTheme.of(context)
                                .primaryContrastingColor),
                        SizedBox(width: 8),
                        Text(
                          "Setup",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor),
                        ),
                      ],
                    ),
                    onPressed: () => {}),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: FullSecondaryCupertinoButton(
                    backgroundColor: CupertinoTheme.of(context)
                        .primaryContrastingColor
                        .withOpacity(0.05),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.link,
                            size: 18,
                            color: CupertinoTheme.of(context)
                                .primaryContrastingColor),
                        SizedBox(width: 8),
                        Text(
                          "Manual",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor),
                        ),
                      ],
                    ),
                    onPressed: () => {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
