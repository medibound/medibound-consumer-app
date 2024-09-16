import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medibound_flutter/res/MedicalUnit.dart';
import 'package:stats/stats.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataLineGraphView extends StatelessWidget {
  final String title;
  final Color color;
  final List<num> data;
  final MedicalUnit unit;

  final bool aggregated;

  List<double>? dataDouble;

  DataLineGraphView({
    required this.title,
    required this.color,
    required this.data,
    required this.unit,
    this.aggregated = false,
  }) {
    dataDouble = data.map((element) => double.parse(element.toString()) ?? 0.0).toList();
  }
  
  Stats get statistics {
    return Stats.fromData(data).withPrecision(1);
  }


  bool get derivative {
    return data!.isNotEmpty && (data.last > statistics.average);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 80,
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title.toUpperCase(),
                              softWrap: false,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                            Text(
                              "${data.length} Records".toUpperCase(),
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  derivative
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  color: color,
                                  size: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 2.0),
                                      child: Text(
                                        "${data.last?.toStringAsFixed(1) ?? '0.0'}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          height: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Text(
                                        unit.abbreviation.toUpperCase(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 25,
                  margin: EdgeInsets.only(top: 5),
                  child: SfCartesianChart(
                    primaryXAxis: NumericAxis(isVisible: false),
                    primaryYAxis: NumericAxis(
                      isVisible: false,
                      minimum: statistics.min.toDouble(),
                      maximum: statistics.max.toDouble(),
                    ),
                    legend: Legend(isVisible: false),
                    margin: EdgeInsets.zero,
                    plotAreaBorderWidth: 0,
                    borderWidth: 0,
                    series: <CartesianSeries>[
                      AreaSeries<double, int>(
                          dataSource: dataDouble,
                          xValueMapper: (double value, int index) => index,
                          yValueMapper: (double value, int index) => value,
                          gradient: LinearGradient(
                              colors: [
                                color.withOpacity(0.5),
                                color.withOpacity(0)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderColor: color,
                          borderWidth: 2),
                      LineSeries<double, int>(
                        dataSource: dataDouble,
                        xValueMapper: (double value, int index) => index,
                        yValueMapper: (double value, int index) => value,
                        color: color,
                        width: 1.5,
                      ),
                      LineSeries<double, int>(
                        dataSource:
                            List<double>.generate(data.length, (_) => statistics.average.toDouble()),
                        xValueMapper: (double value, int index) => index,
                        yValueMapper: (double value, int index) => value,
                        dashArray: <double>[4, 4],
                        color: Colors.grey.withOpacity(0.5),
                        width: 1,
                      ),
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

