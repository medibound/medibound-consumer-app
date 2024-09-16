library dataui;

export 'package:medibound_flutter/ui/one-blocks/DataBasicView.dart';

export 'package:medibound_flutter/ui/two-blocks/DataBarGraphView.dart';
export 'package:medibound_flutter/ui/two-blocks/DataLineGraphView.dart';
export 'package:medibound_flutter/ui/one-blocks/DataFullRingView.dart';
export 'package:medibound_flutter/ui/one-blocks/DataHalfRingView.dart';


import 'package:flutter/cupertino.dart';
import 'package:medibound_flutter/helpers/fhir/Observation.dart';
import 'package:medibound_flutter/res/MbColors.dart';
import 'package:medibound_flutter/ui/DataUI.dart';


class DataUI extends StatelessWidget {
  final Observation observation;

  DataUI({required this.observation});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: observation.header!.map((block) {

        Color color() {
          switch(block['color']) {
            case 'red': return CupertinoColors.systemRed;
            case 'orange': return CupertinoColors.systemOrange;
            case 'yellow': return CupertinoColors.systemYellow;
            case 'green': return CupertinoColors.systemGreen;
            case 'blue': return CupertinoColors.systemBlue;
            case 'purple': return CupertinoColors.systemPurple;
            default : return MbColors.darkaccent(context);
          }
        }
        if (block['size'] == "one-block") {
          return Expanded(
            flex: 1,
          child: Container(
            margin: EdgeInsets.only(right: block == observation.header!.last ? 0 : 5, top: 7.5, bottom: 7.5),
            child: Builder(builder: (context) {
              switch(block['type']) {
              case 'basic': return DataBasicView(title: block['display'], color: color(), value: block['data'], maxValue: 200, unit: block['unit']);
              case 'half-ring': return DataHalfRingView(title: block['display'], color: color(), value: block['data'], maxValue: 200, unit: block['unit']);
              case 'full-ring': return DataFullRingView(title: block['display'], color: color(), value: block['data'], maxValue: 200, unit: block['unit']);
              default: return SizedBox(height: 0,);
            }
            }),
          ));
          
        }
        else if (block['size'] == "two-block") {
          return Expanded(
            flex: 2,
          child: Container(
            margin: EdgeInsets.only(right: block == observation.header!.last ? 0 : 5, top: 7.5, bottom: 7.5),
            child: Builder(builder: (context) {
              switch(block['type']) {
              case 'line-graph': return DataLineGraphView(title: block['display'], color: color(), data: block['data'], unit: block['unit']);
              case 'bar-graph': return DataBarGraphView(title: block['display'], color: color(), data: block['data'], unit: block['unit']);
              default: return SizedBox(height: 0,);
              }
            }),
          ));
          
          
        }
        else {
          return SizedBox(height: 0,);
        }
        
      }).toList(),)
    );
  }
}
