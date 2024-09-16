import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medibound_flutter/res/MedicalUnit.dart';
import 'package:medibound_flutter/ui/DataUI.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'dart:math';


class DataFullRingView extends StatelessWidget {
  final String title;
  final double value;
  final double maxValue;
  final Color color;
  final MedicalUnit unit;

  DataFullRingView({
    required this.title,
    required this.value,
    required this.maxValue,
    required this.color,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Transform.translate(
        offset: Offset(0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: Center(
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      startAngle: 270,
                      endAngle: 270,
                      axisLineStyle: AxisLineStyle(
                        thickness: 7, // Adjust the thickness as needed
                        color: Colors.grey.withOpacity(0.15),
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: value,
                          width: 7,
                          cornerStyle: CornerStyle.bothCurve,
                          color: color,
                          gradient: SweepGradient(colors: [
                            color.withOpacity(0.4),
                            color,
                          ]),
                        )
                      ],
                      maximum: maxValue,
                      showLabels: false, // Hide the axis labels
                      showTicks: false, // Hide the ticks

                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Container(
                            width: 42,
                            height: 45,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: 16,
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    title.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: color,
                                      height: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("${value.roundedToString()}",
                                    style: TextStyle(
                                      height: 0.6,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(unit.abbreviation.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 7,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
