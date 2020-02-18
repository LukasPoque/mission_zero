import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class SchedulePage extends StatelessWidget {
  final Color color;

  SchedulePage(this.color);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListItem("Dishwasher"),
        ListItem("Washing machine"),
        ListItem("Dryer"),
        ListItem("Fridge")
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final String name;

  ListItem(this.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(name),
        Container(
          child: FlutterSlider(
            values: [30, 420],
            rangeSlider: true,
            max: 500,
            min: 0,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              //_lowerValue = lowerValue;
              //_upperValue = upperValue;
              //setState(() {});
            },
          ),
        )
      ],
    );
  }
}
