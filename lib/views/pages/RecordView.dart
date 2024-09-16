import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/Observation.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:medibound_flutter/res/Patient.dart';
import 'package:medibound_flutter/views/pages/observation/ObservationDetailsView.dart';
import 'package:medibound_flutter/views/pages/observation/ObservationHeader.dart';

class RecordView extends StatefulWidget {
  final Patient mbUser;

  final CupertinoTabController tabController;

  RecordView({required this.mbUser, required this.tabController});


  @override
  _RecordViewState createState() => _RecordViewState(mbUser: this.mbUser, tabController: this.tabController);
}

class _RecordViewState extends State<RecordView> {
  final Patient mbUser;
  final CupertinoTabController tabController;
  bool isLoading = true;
  String searchTerm = "";
  String selectedFilter = "All";

  _RecordViewState({required this.mbUser, required this.tabController});

  GoogleCloudService googleCloudService = GoogleCloudService();

  List<Observation> observations = []; // Assume this list is populated with data.

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
    List<Observation> observationsFinal = await fhirFunctions.observation.listObservationsForPatient(
      patientReference: 'Patient/' + id, // Replace with your patient reference
    );

    setState(() {
      observations = observationsFinal;
      isLoading = false;
    });
  }

  List<Observation> getFilteredObservations() {
    List<Observation> filtered = observations;

    if (searchTerm.isNotEmpty) {
      filtered = filtered.where((observation) {
        return observation.observationDefinition!.preferredReportName
            .toLowerCase()
            .contains(searchTerm.toLowerCase());
      }).toList();
    }

    if (selectedFilter != "All") {
      filtered = filtered.where((observation) {
        return observation.observationDefinition!.category['display'] == selectedFilter;
      }).toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CupertinoTheme.of(context).primaryColor.withOpacity(0.05),
              CupertinoTheme.of(context).primaryColor.withOpacity(0),
              CupertinoTheme.of(context).primaryColor.withOpacity(0.05),
              CupertinoTheme.of(context).primaryColor.withOpacity(0.1),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text("My Records"),
              border: Border.all(width: 0, color: Colors.transparent),
              backgroundColor: Colors.transparent,
              leading: CupertinoButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(CupertinoIcons.back),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverSearchBarDelegate(
                minHeight: 120.0,
                maxHeight: 120.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CupertinoSearchTextField(
                        backgroundColor: CupertinoTheme.of(context)
                            .primaryContrastingColor
                            .withOpacity(0.05),
                        onChanged: (value) {
                          setState(() {
                            searchTerm = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            FilterButton(
                              text: "All",
                              isSelected: selectedFilter == "All",
                              onPressed: () {
                                setState(() {
                                  selectedFilter = "All";
                                });
                              },
                            ),
                            FilterButton(
                              text: "👥 Social History",
                              isSelected: selectedFilter == "Social History",
                              onPressed: () {
                                setState(() {
                                  selectedFilter = "Social History";
                                });
                              },
                            ),
                            FilterButton(
                              text: "🫀 Vital Signs",
                              isSelected: selectedFilter == "Vital Signs",
                              onPressed: () {
                                setState(() {
                                  selectedFilter = "Vital Signs";
                                });
                              },
                            ),
                            FilterButton(
                              text: "📷 Imaging",
                              isSelected: selectedFilter == "Imaging",
                              onPressed: () {
                                setState(() {
                                  selectedFilter = "Imaging";
                                });
                              },
                            ),
                            FilterButton(
                              text: "🔬 Laboratory",
                              isSelected: selectedFilter == "Laboratory",
                              onPressed: () {
                                setState(() {
                                  selectedFilter = "Laboratory";
                                });
                              },
                            ),
                            FilterButton(
                              text: "🏥 Procedure",
                              isSelected: selectedFilter == "Procedure",
                              onPressed: () {
                                setState(() {
                                  selectedFilter = "Procedure";
                                });
                              },
                            ),
                            FilterButton(
                              text: "📝 Survey",
                              isSelected: selectedFilter == "Survey",
                              onPressed: () {
                                setState(() {
                                  selectedFilter = "Survey";
                                });
                              },
                            ),
                            FilterButton(
                              text: "✅ Exam",
                              isSelected: selectedFilter == "Exam",
                              onPressed: () {
                                setState(() {
                                  selectedFilter = "Exam";
                                });
                              },
                            ),
                            FilterButton(
                              text: "🧑‍⚕️ Therapy",
                              isSelected: selectedFilter == "Therapy",
                              onPressed: () {
                                setState(() {
                                  selectedFilter = "Therapy";
                                });
                              },
                            ),
                            FilterButton(
                              text: "🏃 Activity",
                              isSelected: selectedFilter == "Activity",
                              onPressed: () {
                                setState(() {
                                  selectedFilter = "Activity";
                                });
                              },
                            ),
                            // Add more filters as needed
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CupertinoSliverRefreshControl(
              onRefresh: fetchObservations,
            ),
            SliverToBoxAdapter(
              child: isLoading
                  ? Center(child: Container(padding: EdgeInsets.all(16), child: CupertinoActivityIndicator(radius: 14)))
                  : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: getFilteredObservations().map((observation) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: ObservationHeader(observation: observation, tabController: tabController,),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  FilterButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: isSelected ? MbColors.darkaccent(context).withOpacity(0.1) : CupertinoTheme.of(context)
            .primaryContrastingColor
            .withOpacity(0.05),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            height: 1,
            color: isSelected ? MbColors.darkaccent(context) : CupertinoTheme.of(context)
                .primaryContrastingColor,
          ),
        ),
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
