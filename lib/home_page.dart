import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as Math;
import 'color_palette.dart';
import 'main.dart';

const double START_MONEY_SAVED = 12.43;
const double START_CO_SAVED = 136;
const double START_ECO_SCORE = 0.71;

class HomePage extends StatelessWidget {
  final List<SchedulerData> data;
  final Function(SchedulerData) onNewSchedulerData;

  HomePage(this.data, this.onNewSchedulerData);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            Card(
                elevation: 10,
                child: Column(
                  children: <Widget>[
                    RandomizedRadialChartExample(),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 5, right: 5),
                            child: Text("eco score by ©EcoFlex")))
                  ],
                )),
            Information(),
            data.isEmpty ? Container() : ScheduleTimeline(data)
          ],
        ));
  }
}

class RandomizedRadialChartExample extends StatefulWidget {
  @override
  _RandomizedRadialChartExampleState createState() =>
      new _RandomizedRadialChartExampleState();
}

class _RandomizedRadialChartExampleState
    extends State<RandomizedRadialChartExample> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(350.0, 350.0);
  final Math.Random random = new Math.Random();
  List<CircularStackEntry> data;

  @override
  void initState() {
    super.initState();
    data = _generateRandomData();
  }

  double value = 50.0;

  void _randomize() async {
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        data = _generateRandomData();
        _chartKey.currentState.updateData(data);
      });
    });
  }

  List<CircularStackEntry> _generateRandomData() {
    int stackCount = 3;
    List<CircularStackEntry> data = new List.generate(stackCount, (i) {
      int segCount = 0;
      while (segCount == 0) {
        segCount = random.nextInt(10);
      }
      List<CircularSegmentEntry> segments = new List.generate(segCount, (j) {
        Color randomColor = ColorPalette.primary.random(random);
        double nextDouble = 0.0;
        while (nextDouble == 0 || nextDouble < 0.3) {
          nextDouble = random.nextDouble();
        }
        return new CircularSegmentEntry(nextDouble, randomColor);
      });
      return new CircularStackEntry(segments);
    });

    return data;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _labelStyle = Theme.of(context).textTheme.title.merge(
        new TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 55));

    _randomize();
    return new AnimatedCircularChart(
      key: _chartKey,
      size: _chartSize,
      initialChartData: data,
      holeLabel: START_ECO_SCORE.toString(),
      labelStyle: _labelStyle,
      chartType: CircularChartType.Radial,
    );
  }
}

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 40, right: 40, bottom: 25),
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[MoneyText(), Text("Saved money")],
              )),
          Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: <Widget>[COText(), Text("Saved CO2")],
              ))
        ],
      ),
    );
  }
}

class MoneyText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MoneyTextState();
}

class _MoneyTextState extends State<MoneyText> {
  final double stepSize = 0.2;
  double money = 0.0;
  double targetMoney = START_MONEY_SAVED;

  void runningText() {
    Future.delayed(const Duration(milliseconds: 2), () {
      if (money < targetMoney) {
        setState(() {
          if (targetMoney - money < 0.5) {
            money = START_MONEY_SAVED;
          } else {
            money += stepSize;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    runningText();
    return Text(
      money.toStringAsFixed(2) + "€",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
    );
  }
}

class COText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _COTextState();
}

class _COTextState extends State<COText> {
  final double stepSize = 3;
  double co = 0.0;
  double targetCO = START_CO_SAVED;

  void runningText() {
    Future.delayed(const Duration(milliseconds: 2), () {
      if (co < targetCO) {
        setState(() {
          if (targetCO - co < 5) {
            co = START_CO_SAVED;
          } else {
            co += stepSize;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    runningText();
    return Text(
      co.floor().toString() + "kg",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
    );
  }
}

class ScheduleTimeline extends StatelessWidget {
  final List<SchedulerData> data;

  ScheduleTimeline(this.data);

  @override
  Widget build(BuildContext context) {
    List<Widget> childes = new List<Widget>();
    for (int i = 0; i < data.length; i++) {
      childes.add(new Card(
        elevation: 10,
        child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                i == 0
                    ? CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        radius: 40,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/logo_black.svg"))
                        //Icon(Icons.battery_charging_full,color: Colors.black, size: 50),
                        )
                    : Container(),
                i == 0
                    ? Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        height: 5,
                        color: Colors.black,
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 15),
                      ),
                Row(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: Icon(Icons.access_time)),
                    Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: Text(
                          data[i].time,
                          style: TextStyle(fontSize: 24),
                        )),
                    Text(
                      data[i].schedulerName,
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                Container(margin: const EdgeInsets.only(bottom: 15)),
              ],
            )),
      ));
    }
    return Column(
      children: childes,
    );
  }
}
