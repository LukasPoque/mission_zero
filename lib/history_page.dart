import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HistoryPage extends StatelessWidget {
  final Color color;

  HistoryPage(this.color);

  @override
  Widget build(BuildContext context) {
    return ConsumptionChart();
  }
}

class ConsumptionChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConsumptionChartState();
  }
}

class _ConsumptionChartState extends State<ConsumptionChart> {
  List<List<dynamic>> data = [];
  List<charts.Series<ConsumerData, double>> seriesList = new List<charts.Series<ConsumerData, double>>();
  bool ready = false;

  loadAssetData() async {
    final myData = await rootBundle.loadString("assets/power_sample.csv");
    List<List<dynamic>> csvTable =
        CsvToListConverter(eol: '\n').convert(myData);
    data = csvTable;
    createSeries();
  }

  createSeries() {
    List<ConsumerData> dishwasherList = new List<ConsumerData>();
    for (int i = 1; i < 100; i++) {
      double time = double.parse(
          (data[i][0].substring(13, 16).toString().replaceAll(":", ".")));
      double consumption = data[i][1];
      dishwasherList.add(new ConsumerData(time, consumption));
    }
    //geschirr
    seriesList.add(new charts.Series<ConsumerData, double>(
      id: "Dishwasher",
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      areaColorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault.lighter,
      domainFn: (ConsumerData dataC, _) => dataC.timestamp,
      measureFn: (ConsumerData dataC, _) => dataC.consumption,
      data: dishwasherList,
    ));
    ready = true;
  }

  @override
  void initState() {
    super.initState();
    loadAssetData();
  }

  @override
  Widget build(BuildContext context) {
    return !ready
        ? CircularProgressIndicator()
        : StackedAreaCustomColorLineChart(seriesList);
  }
}

class StackedAreaCustomColorLineChart extends StatelessWidget {
  final List<charts.Series<ConsumerData, double>> seriesList;

  StackedAreaCustomColorLineChart(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList,
        defaultRenderer:
            new charts.LineRendererConfig(includeArea: true, stacked: true),
        animate: false);
  }
}

class ConsumerData {
  final double timestamp; //[3.10]
  final double consumption;

  ConsumerData(this.timestamp, this.consumption);
}
