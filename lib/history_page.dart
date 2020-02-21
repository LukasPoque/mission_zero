import 'package:fl_animated_linechart/chart/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage();

  @override
  Widget build(BuildContext context) {
    return HistoryChart();
  }
}

class HistoryChart extends StatelessWidget {
  HistoryChart();

  //This should be loaded from
  Map<DateTime, double> createDishwasherLine() {
    Map<DateTime, double> newData = {};
    for (int i = 1; i < 25; i++) {
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 00:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 01:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 02:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 03:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 04:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 05:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 06:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 07:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 08:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 09:00:00")] = 401.74;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 10:00:00")] = 744.59;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 11:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 12:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 13:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 14:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 15:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 16:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 17:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 18:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 19:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 20:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 21:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 22:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 23:00:00")] = 0;
    }
    return newData;
  }

  Map<DateTime, double> createWashingLine() {
    Map<DateTime, double> newData = {};
    for (int i = 1; i < 25; i++) {
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 00:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 01:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 02:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 03:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 04:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 05:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 06:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 07:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 08:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 09:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 10:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 11:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 12:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 13:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 14:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 15:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 16:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 17:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 18:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 19:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 20:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 21:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 22:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 23:00:00")] = 0;
    }
    return newData;
  }

  Map<DateTime, double> createDryerLine() {
    Map<DateTime, double> newData = {};
    for (int i = 1; i < 25; i++) {
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 00:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 01:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 02:00:00")] = 10.92;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 03:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 04:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 05:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 06:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 07:00:00")] = 0.03;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 08:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 09:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 10:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 11:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 12:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 13:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 14:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 15:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 16:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 17:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 18:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 19:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 20:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 21:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 22:00:00")] = 0;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 23:00:00")] = 0;
    }
    return newData;
  }

  Map<DateTime, double> createOverallLine() {
    Map<DateTime, double> newData = {};
    for (int i = 1; i < 25; i++) {
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 00:00:00")] = 429.146;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 01:00:00")] = 427.890;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 02:00:00")] = 407.193;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 03:00:00")] = 413.522;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 04:00:00")] = 411.394;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 05:00:00")] = 399.474;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 06:00:00")] = 439.748;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 07:00:00")] = 530.846;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 08:00:00")] = 607.755;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 09:00:00")] = 1036.856;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 10:00:00")] = 1386.164;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 11:00:00")] = 512.114;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 12:00:00")] = 1072.327;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 13:00:00")] = 653.938;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 14:00:00")] = 394.050;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 15:00:00")] = 385.094;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 16:00:00")] = 408.348;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 17:00:00")] = 336.350;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 18:00:00")] = 342.823;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 19:00:00")] = 331.308;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 20:00:00")] = 343.152;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 21:00:00")] = 452.797;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 22:00:00")] = 474.406;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss")
          .parse("2019/10/31 23:00:00")] = 384.781;
    }
    return newData;
  }

  @override
  Widget build(BuildContext context) {
    Map<DateTime, double> line1 = createDishwasherLine();
    Map<DateTime, double> line2 = createWashingLine();
    Map<DateTime, double> line3 = createDryerLine();
    Map<DateTime, double> line4 = createOverallLine();

    LineChart chart = new LineChart.fromDateTimeMaps(
        [line1, line2, line3, line4],
        [Colors.green, Colors.green[200], Colors.green[200], Colors.blue],
        ['Wh', 'Wh', 'Wh', 'Wh']);
    return AnimatedLineChart(
      chart,
      key: UniqueKey(),
    );
  }
}
