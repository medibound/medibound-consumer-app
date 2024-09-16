import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medibound_flutter/res/MedicalUnit.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'dart:math';

extension DoubleExtension on double {
  /// Rounds the double to a total of `totalDigits` significant digits.
  String roundedToString({int totalDigits = 3}) {
    double roundedValue = rounded(totalDigits: totalDigits);
    if (roundedValue == roundedValue.toInt()) {
      // It's effectively an integer, so return as integer string
      return roundedValue.toInt().toString();
    } else {
      // It has a fractional part, so return with fractional part
      // Note: Adjust the format as needed to limit the total digits, including decimal points.
      return roundedValue.toStringAsFixed(1);
    }
  }

  /// Rounds the Double to a total of `totalDigits` significant digits.
  double rounded({int totalDigits = 3}) {
    int digitCount = (this == 0 ? 0 : 1 + log(this.abs()) / ln10).floor();
    int decimalPlaces = max(0, totalDigits - digitCount);

    // Use this factor to round the number.
    double divisor =
        pow(10.0, decimalPlaces.toDouble()).toDouble(); // Cast to double
    return (this * divisor).round() / divisor;
  }
}

class DataBasicView extends StatelessWidget {
  final String title;
  final double value;
  final double maxValue;
  final Color color;
  final MedicalUnit unit;

  DataBasicView({
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
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: color,
                  height: 1,
                ),
              ),
              SizedBox(height: 10),
              Text("${value.roundedToString()}",
                  style: TextStyle(
                    height: 0.8,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Text(unit.abbreviation.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    height: 1,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
