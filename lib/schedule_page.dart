import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import 'algo.dart';
import 'custom_dialog.dart';

class SchedulePage extends StatelessWidget {
  final Color color;

  SchedulePage(this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListItem("Dishwasher", 15, 20),
        ListItem("Washing machine", 8, 17),
        ListItem("Dryer", 15, 20)
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final String name;
  final double startValue;
  final double endValue;
  double _lowerValue;
  double _upperValue;

  ListItem(this.name, this.startValue, this.endValue);

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 10,
      child: Column(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
          Container(
            child: FlutterSlider(
              values: [startValue, endValue],
              rangeSlider: true,
              max: 24,
              min: 0,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                _lowerValue = lowerValue;
                _upperValue = upperValue;
              },
              hatchMark: FlutterSliderHatchMark(
                distanceFromTrackBar: 10,
                labels: [
                  FlutterSliderHatchMarkLabel(percent: 0, label: Text('0am')),
                  FlutterSliderHatchMarkLabel(percent: 25, label: Text('6am')),
                  FlutterSliderHatchMarkLabel(percent: 50, label: Text('12pm')),
                  FlutterSliderHatchMarkLabel(percent: 75, label: Text('6pm')),
                  FlutterSliderHatchMarkLabel(percent: 100, label: Text('0am')),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 220.0, top: 20, bottom: 15),
            child: RaisedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog(
                        title: "The best starting time for your " + name + ":",
                        description: calculateSpot(
                            _lowerValue.floor(), _upperValue.floor()),
                        buttonText: "Agree",
                      );
                    });
              },
              child: Text('Confirm', style: TextStyle(fontSize: 20)),
            ),
          )
        ],
      ),
    );
  }

  String calculateSpot(start, end) {
    return Algo.main(start, 0, end, 0);
  }
}
