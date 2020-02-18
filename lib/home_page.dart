import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'dart:math' as Math;
import 'color_palette.dart';

double START_MONEY_SAVED = 12.43;
double START_ECO_SCORE = 0.67;

class HomePage extends StatelessWidget {
  final Color color;

  HomePage(this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            RandomizedRadialChartExample(),
            Center(
                child: Container(
              height: 50,
              width: 50,
              color: Colors.red,
            ))
          ],
        ),
        MoneyText()
      ],
    );
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
    _randomize();
    return new AnimatedCircularChart(
      key: _chartKey,
      size: _chartSize,
      initialChartData: data,
      chartType: CircularChartType.Radial,
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
