import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medibound_flutter/helpers/fhir/Observation.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:medibound_flutter/ui/DataUI.dart';
import 'package:ticker_text/ticker_text.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

class ObservationDetailsView extends StatelessWidget {
  final Observation observation;
  final ScrollController _controller = ScrollController();
  final CupertinoTabController tabController;

  ObservationDetailsView(
      {super.key, required this.observation, required this.tabController});

  String getCategory() {
    switch (observation.observationDefinition!.category['display']) {
      case 'Social History':
        return "👥 Social History";
      case 'Vital Signs':
        return "🫀 Vital Signs";
      case 'Imaging':
        return "📷 Imaging";
      case 'Laboratory':
        return "🔬 Laboratory";
      case 'Procedure':
        return "🏥 Procedure";
      case 'Survey':
        return "📝 Survey";
      case 'Exam':
        return "✅ Exam";
      case 'Therapy':
        return "🧑‍⚕️ Therapy";
      case 'Activity':
        return "🏃 Activity";
      default:
        return "Unknown";
    }
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
                    Column(
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
                                  returnDuration: Duration(milliseconds: 3000),
                                  child: Text(
                                    observation.observationDefinition!
                                            .preferredReportName.isEmpty
                                        ? 'Unnamed Observation'
                                        : observation.observationDefinition!
                                            .preferredReportName,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(right: 5),
                                height: 30,
                                decoration: BoxDecoration(
                                    color: CupertinoTheme.of(context)
                                        .primaryContrastingColor
                                        .withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Icon(CupertinoIcons.calendar,
                                        size: 12,
                                        color: CupertinoTheme.of(context)
                                            .primaryContrastingColor),
                                    SizedBox(width: 5),
                                    Text(
                                        convertDate(
                                            observation.effectiveDateTime),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12)),
                                  ],
                                )),
                            Container(
                                padding: EdgeInsets.all(8),
                                height: 30,
                                decoration: BoxDecoration(
                                    color: CupertinoTheme.of(context)
                                        .primaryContrastingColor
                                        .withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Text(getCategory(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            height: 1)),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(height: 5),
                        GestureDetector(
                          onTap: () async {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            Future.delayed(Duration(milliseconds: 500), () {
                              tabController.index = 1;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(CupertinoIcons.arrow_up_right_square,
                                  size: 16,
                                  color: MbColors.darkaccent(context)),
                              SizedBox(width: 6),
                              Expanded(
                                child: TickerText(
                                  speed: 30,
                                  endPauseDuration:
                                      Duration(milliseconds: 5000),
                                  startPauseDuration:
                                      Duration(milliseconds: 5000),
                                  returnDuration: Duration(milliseconds: 3000),
                                  child: Row(
                                    children: [
                                      Text(
                                        "From ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: CupertinoColors.systemGrey),
                                      ),
                                      Text(
                                        (observation.device!.displayName ==
                                                    null ||
                                                observation
                                                    .device!.displayName.isEmpty
                                            ? 'Unnamed Device'
                                            : observation.device!.displayName),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                MbColors.darkaccent(context)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            observation.device!.owner?.pictureUrl == null ||
                                    observation
                                        .device!.owner!.pictureUrl!.isEmpty
                                ? const Icon(CupertinoIcons.device_laptop,
                                    size: 16, color: MbColors.greygreen)
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Image.network(
                                      observation.device!.owner!.pictureUrl!,
                                      width: 16,
                                      height: 16,
                                    ),
                                  ),
                            SizedBox(width: 6),
                            Expanded(
                              child: TickerText(
                                speed: 30,
                                endPauseDuration: Duration(milliseconds: 5000),
                                startPauseDuration:
                                    Duration(milliseconds: 5000),
                                returnDuration: Duration(milliseconds: 3000),
                                child: Text(
                                  "By " +
                                      (observation.device!.owner?.name ==
                                                  null ||
                                              observation
                                                  .device!.owner!.name!.isEmpty
                                          ? 'Unnamed Organization'
                                          : observation.device!.owner!.name!),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: CupertinoColors.systemGrey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Primary Record",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(child: DataUI(observation: observation)),
                    SizedBox(height: 10),
                    Text(
                      "More Details",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Further Details Coming Soon...",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 14,
                              height: 2),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Record Information",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Observation Definition ID: " +
                              observation.observationDefinitionId,
                          style: TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 14,
                              height: 1.5),
                        ),
                        Text(
                          "Device ID: " + observation.deviceId,
                          style: TextStyle(
                              color: CupertinoColors.systemGrey,
                              fontSize: 14,
                              height: 1.5),
                        ),
                        Text(
                          "Effective Date: " + observation.effectiveDateTime,
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
          SizedBox(height: 20),
          FullSecondaryCupertinoButton(
              backgroundColor: MbColors.darkgreen(context).withOpacity(0.1),
              opacity: 0.03,
              child: Row(
                children: [
                  SvgPicture.asset('lib/assets/bounds-spark.svg', width: 18, height: 18, color: MbColors.darkaccent(context)),
                  SizedBox(width: 8),
                  Text(
                    "What's Next",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: MbColors.darkaccent(context)),
                  ),
                  Spacer(),
                  Icon(CupertinoIcons.arrow_turn_down_right,
                      size: 18, color: MbColors.darkaccent(context)),
                ],
              ),
              onPressed: ()  {

                Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            Future.delayed(Duration(milliseconds: 500), () {
                              tabController.index = 2;
                            });
              }),
        ],
      ),
    );
  }
}
