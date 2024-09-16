import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medibound_flutter/res/MedicalUnit.dart';
import 'package:medibound_flutter/ui/DataUI.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'dart:math';

class DataHalfRingView extends StatelessWidget {
  final String title;
  final double value;
  final double maxValue;
  final Color color;
  final MedicalUnit unit;

  DataHalfRingView({
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
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
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
            Container(
              height: 16,
              alignment: Alignment.center,
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
            SizedBox(
              width: 55,
              height: 50,
              child: Center(
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      startAngle: 150,
                      endAngle: 30,
                      axisLineStyle: AxisLineStyle(
                        cornerStyle: CornerStyle.bothCurve,
                        thickness: 7, // Adjust the thickness as needed
                        color: Colors.grey.withOpacity(0.15),
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: value,
                          width: 7,
                          cornerStyle: CornerStyle.bothCurve,
                          gradient: SweepGradient(
                              colors: [color.withOpacity(0.3), color]),
                        )
                      ],
                      maximum: maxValue,
                      showLabels: false, // Hide the axis labels
                      showTicks: false, // Hide the ticks

                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
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
                          positionFactor: 0.3,
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
