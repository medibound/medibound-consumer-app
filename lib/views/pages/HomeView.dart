import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/Observation.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:medibound_flutter/res/Patient.dart';
import 'package:medibound_flutter/views/pages/RecordView.dart';
import 'package:medibound_flutter/views/pages/observation/ObservationDetailsView.dart';
import 'package:medibound_flutter/views/pages/observation/ObservationHeader.dart';

class HomeView extends StatefulWidget {
  final Patient mbUser;
  final CupertinoTabController tabController;

  HomeView({required this.mbUser, required this.tabController});

  @override
  _HomeViewState createState() => _HomeViewState(mbUser: this.mbUser, tabController: this.tabController);
}

class _HomeViewState extends State<HomeView> with AutomaticKeepAliveClientMixin {
  final Patient mbUser;
  final CupertinoTabController tabController;
  bool isLoading = true;

  @override
  bool get wantKeepAlive => true;


  _HomeViewState({required this.mbUser, required this.tabController});

  GoogleCloudService googleCloudService = GoogleCloudService();

  List<Observation> observations =
      []; // Assume this list is populated with data.
  Observation? mostRecentObservation;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    fetchObservations();
  }

  Future<void> fetchObservations() async {
    FHIRFunctions fhirFunctions = await googleCloudService.init();
    String id = await mbUser.init(fhirFunctions.identityToken);
    List<Observation> observationsFinal =
        await fhirFunctions.observation.listObservationsForPatient(
      patientReference: 'Patient/' + id, // Replace with your patient reference
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
      String category =
          observation.observationDefinition!.category['display'];
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
    super.build(context);
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("My Home"),
            border: Border.all(width: 0, color: Colors.transparent),
            backgroundColor: Colors.transparent,
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              onPressed: () => {},
              child: Container(
                width: 100,
                child: Row(
                  children: [
                    SvgPicture.asset(
                          'lib/assets/wallet.svg',
                          width: 20,
                          height: 20,
                          color: MbColors.darkaccent(context)
                        ),
                    SizedBox(width: 6,),
                    Text("Wallet"),
                  ],
                ),
              ),
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              onPressed: () => {},
              child: Text("Add Record"),
            ),
          ),
          SliverToBoxAdapter(
              child: isLoading
                  ? Center(child: Container(padding: EdgeInsets.all(16),child: CupertinoActivityIndicator(radius:14)))
                  : Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "👋 Welcome Back, " +
                                  (mbUser.givenNames![0] ?? "") +
                                  "!",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  color: CupertinoTheme.of(context)
                                      .scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                        BoxShadow(
                                          color: CupertinoColors.black.withOpacity(0.07),
                                          spreadRadius: 2,
                                          blurRadius: 20,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                  ),
                                  
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      CupertinoColors.activeBlue
                                          .withOpacity(0.1),
                                      CupertinoTheme.of(context)
                                          .primaryColor
                                          .withOpacity(0),
                                      MbColors.darkaccent(context)
                                          .withOpacity(0.1),
                                      MbColors.darkaccent(context)
                                          .withOpacity(0.15),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        CupertinoColors.activeBlue
                                            .withOpacity(0.1),
                                        CupertinoTheme.of(context)
                                            .primaryColor
                                            .withOpacity(0),
                                        CupertinoColors.activeOrange
                                            .withOpacity(0.05),
                                        CupertinoColors.systemPink
                                            .withOpacity(0.15),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "OUR COMMITMENT TO YOU:"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 2,
                                                  fontSize: 12,
                                                  color: CupertinoTheme.of(
                                                          context)
                                                      .primaryContrastingColor
                                                      .withOpacity(0.8))),
                                          SizedBox(height: 10),
                                          Text("We Will Always Place",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22)),
                                          SizedBox(height: 4),
                                          Text('Your Health in Your Hands',
                                              style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                        color: CupertinoTheme
                                                                .of(context)
                                                            .primaryContrastingColor,
                                                        offset: Offset(0, -4))
                                                  ],
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.transparent,
                                                  fontSize: 22,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor:
                                                      MbColors.darkaccent(
                                                              context)
                                                          .withOpacity(0.8),
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  decorationThickness: 1.5)),
                                          SizedBox(height: 15),
                                          Row(
                                            children: [
                                              Text(
                                                'the',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(width: 8),
                                              SvgPicture.asset(
                                                  'lib/assets/medibound.svg',
                                                  width: 15,
                                                  height: 15,
                                                  color: MbColors.darkaccent(
                                                      context)),
                                              SizedBox(width: 6),
                                              Text(
                                                'medibound',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                'team',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    )),
          SliverToBoxAdapter(
            child: isLoading
                ? Center(child: SizedBox(height: 10))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("🗂️ Latest Record",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                                Spacer(),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.centerLeft,
                                  onPressed: () => {
                                    Navigator.of(context).push(
                                      CupertinoPageRoute(builder: (context) => RecordView(mbUser: mbUser, tabController: tabController,)),
                                    )
                                  },
                                  child: Text("View All"),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            mostRecentObservation != null ? Stack(
                              children: [
                                ObservationHeader(observation: mostRecentObservation!, tabController: tabController,),
                              ],
                            )
                            
                            : SizedBox(height: 10),
                            // Add content for "My Records"
                            SizedBox(height: 10),
                            Text("🔴 Live Activities",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            // Display the most recent observation
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Live Activities Are Not Available Yet",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: CupertinoColors.systemGrey,
                                      fontSize: 14,
                                      height: 2.5),
                                ),
                              ],
                            ),
                            // Add content for "Recent Activity"
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
