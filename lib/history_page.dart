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

class _ConsumptionChartState extends State<ConsumptionChart>{
  List<List<dynamic>> data = [];
  List<charts.Series> seriesList;

  loadAssetData() async {
    final myData = await rootBundle.loadString("assets/power_sample.csv");
    List<List<dynamic>> csvTable = CsvToListConverter(
      eol: '\n'
    ).convert(myData);
    data = csvTable;
    createSeries();
  }

  createSeries() {

  }

  @override
  void initState() {
    super.initState();
    loadAssetData();
  }

  @override
  Widget build(BuildContext context) {
    return seriesList == null ? CircularProgressIndicator() : StackedAreaCustomColorLineChart(seriesList);
  }
}

class StackedAreaCustomColorLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;

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
  final double consumption;
  final DateTime timestamp;

  ConsumerData(this.consumption, this.timestamp);
}