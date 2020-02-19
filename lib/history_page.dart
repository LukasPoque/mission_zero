import 'package:fl_animated_linechart/chart/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:fl_animated_linechart/common/pair.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';

class HistoryPage extends StatelessWidget {
  final Color color;

  HistoryPage(this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(child: StackedAreaCustomColorLineChart()),
        ListView(
          children: <Widget>[
            Card(elevation: 10, child: Text("Dishwasher")),
            Card(elevation: 10, child: Text("Washing machine")),
            Card(elevation: 10, child: Text("Dryer"))
          ],
        ),
      ],
    );
  }
}

/*class ConsumptionChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConsumptionChartState();
  }
}

class _ConsumptionChartState extends State<ConsumptionChart> {
  //List<List<dynamic>> data = [];
  //bool ready = false;

 */ /* loadAssetData() async {
    print("start loading: " + DateTime.now().toIso8601String());
    final myData = await rootBundle.loadString("assets/power_sample.csv");
    List<List<dynamic>> csvTable =
        CsvToListConverter(eol: '\n').convert(myData);
    data = csvTable;
    print("finish loading loading: " + DateTime.now().toIso8601String());
    ready = true;
  }*/ /*

  */ /*@override
  void initState() {
    super.initState();
    loadAssetData();
  }*/ /*

  @override
  Widget build(BuildContext context) {
    return StackedAreaCustomColorLineChart();
  }
}*/

class StackedAreaCustomColorLineChart extends StatelessWidget {
  StackedAreaCustomColorLineChart();

  Map<DateTime, double> createLine() {
    Map<DateTime, double> newData = {};
    for (int i = 1; i < 25; i++) {
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss").parse("2019/10/31 00:00:00")] = 429.14;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss").parse("2019/10/31 01:00:00")] = 427.89;
      newData[new DateFormat("dd/MM/yyyy HH:mm:ss").parse("2019/10/31 02:00:00")] = 407.19;
    }
    return newData;
  }

  @override
  Widget build(BuildContext context) {
    Map<DateTime, double> line1 = createLine();
    LineChart chart =
        new LineChart.fromDateTimeMaps([line1], [Colors.green], ['C']);
    return AnimatedLineChart(
      chart,
      key: UniqueKey(),
    );
  }
}

/*
class ConsumerData {
  final int timestamp; //[3.10]
final int consumption;

ConsumerData(this.timestamp, this.consumption);
}
*/
