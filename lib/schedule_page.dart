import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import 'algo.dart';
import 'custom_dialog.dart';
import 'main.dart';

class SchedulePage extends StatelessWidget {
  final Function(SchedulerData) onNewSchedulerData;

  SchedulePage(this.onNewSchedulerData);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            ListItem("Dishwasher", onNewSchedulerData, 19, 22),
            ListItem("Washing machine", onNewSchedulerData, 8, 17),
            ListItem("Dryer", onNewSchedulerData, 3, 9)
          ],
        ));
  }
}

class ListItem extends StatelessWidget {
  final String name;
  final Function(SchedulerData) onNewSchedulerData;
  final double startValue;
  final double endValue;
  double _lowerValue;
  double _upperValue;

  ListItem(this.name, this.onNewSchedulerData, this.startValue, this.endValue) {
    _lowerValue = startValue;
    _upperValue = endValue;
  }

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
                        name: name,
                        description: calculateSpot(
                            _lowerValue.floor(), _upperValue.floor()),
                        buttonText: "Agree",
                        onAgreed: onAgreedDialog,
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

  void onAgreedDialog(String time, String consumer) {
    onNewSchedulerData(new SchedulerData(time, consumer));
  }
}
