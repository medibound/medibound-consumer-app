import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medibound_flutter/helpers/fhir/Observation.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:medibound_flutter/ui/DataUI.dart';
import 'package:medibound_flutter/views/pages/observation/ObservationDetailsView.dart';
import 'package:ticker_text/ticker_text.dart';

class ObservationHeader extends StatefulWidget {
  final Observation observation;
  final CupertinoTabController tabController;
  void Function()? onTap;
  bool? shortened = false;

  ObservationHeader({required this.observation, required this.tabController, this.shortened, this.onTap}) {
    if (shortened == null) {
      shortened = false;
    }
  }

  @override
  _ObservationHeaderState createState() => _ObservationHeaderState(observation: observation, tabController: tabController, shortened: shortened, onTap: onTap);
}

class _ObservationHeaderState extends State<ObservationHeader> {
  final Observation observation;
  final CupertinoTabController tabController;
  bool? shortened = false;
  void Function()? onTap;
  double scale = 1.0;

  _ObservationHeaderState({required this.observation, required this.tabController, this.shortened, this.onTap});

  void _showDialog(Observation observation) {
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

            if (observation.patientId.isEmpty) {
              Navigator.pop(context);
            }
            return Container(
              height: 600,
              padding: const EdgeInsets.only(top: 6.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  MbColors.darkaccent(context).withOpacity(0.05),
                  MbColors.darkaccent(context).withOpacity(0.01),
                  (observation.device!.owner?.color == null
                          ? MbColors.darkaccent(context)
                          : observation.device!.owner!.color)!
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
                      child: ObservationDetailsView(
                        key: ValueKey<Observation>(observation),
                        observation: observation,
                        tabController: tabController,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      scale = 1.0;
    });
  }

  void _onLongPressDown(LongPressDownDetails details) {
    setState(() {
      scale = 0.95;
    });
  }

  void _onLongPressUp() {
    setState(() {
      scale = 1.0;
    });
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
        
        Future.delayed(Duration(milliseconds: 100), () {
          _showDialog(observation);
        });
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onLongPressDown: _onLongPressDown,
      onLongPressUp: _onLongPressUp,
      child: AnimatedScale(
        scale: scale,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: CupertinoTheme.of(context).barBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.black.withOpacity(0.07),
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15), bottom: shortened! ? Radius.circular(15): Radius.circular(0)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            (observation.device!.owner?.color == null
                                    ? MbColors.darkaccent(context)
                                    : observation.device!.owner?.color)!
                                .withOpacity(0.05),
                            (observation.device!.owner?.color == null
                                    ? MbColors.darkaccent(context)
                                    : observation.device!.owner?.color)!
                                .withOpacity(0.07),
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: TickerText(
                                          speed: 30,
                                          endPauseDuration: Duration(milliseconds: 5000),
                                          startPauseDuration: Duration(milliseconds: 5000),
                                          returnDuration: Duration(milliseconds: 3000),
                                          child: Text(
                                            observation.observationDefinition!.preferredReportName.isEmpty
                                                ? 'Unnamed Observation'
                                                : observation.observationDefinition!.preferredReportName,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                                    observation.device!.owner?.pictureUrl == null ||
                                            observation.device!.owner!.pictureUrl!.isEmpty
                                        ? const Icon(
                                            CupertinoIcons.device_laptop,
                                            size: 15,
                                            color: MbColors.greygreen,
                                          )
                                        : ClipRRect(
                                            borderRadius: BorderRadius.circular(3),
                                            child: Image.network(
                                              observation.device!.owner!.pictureUrl!,
                                              width: 15,
                                              height: 15,
                                            ),
                                          ),
                                    SizedBox(width: 6),
                                    Expanded(
                                      child: TickerText(
                                        speed: 30,
                                        endPauseDuration: Duration(milliseconds: 5000),
                                        startPauseDuration: Duration(milliseconds: 5000),
                                        returnDuration: Duration(milliseconds: 3000),
                                        child: Text(
                                          "From " +
                                              (observation.device!.displayName == null ||
                                                      observation.device!.displayName.isEmpty
                                                  ? 'Unnamed Device'
                                                  : observation.device!.displayName) +
                                              " by " +
                                              (observation.device!.owner?.name == null ||
                                                      observation.device!.owner!.name!.isEmpty
                                                  ? 'Unnamed Organization'
                                                  : observation.device!.owner!.name!),
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: CupertinoColors.systemGrey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: CupertinoTheme.of(context).primaryContrastingColor.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.calendar,
                                        size: 12,
                                        color: CupertinoTheme.of(context).primaryContrastingColor,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        convertDate(observation.effectiveDateTime),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  shortened!
                  ? SizedBox.shrink()
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.5),
                    child: DataUI(observation: observation),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
