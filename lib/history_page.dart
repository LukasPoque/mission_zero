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
    return ListView(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
      children: <Widget>[
        Container(
            height: 450,
            alignment: Alignment.center,
            child: ConsumptionChart()),
        Container(height: 30),
        Container(
          height: 220,
          child: ListView(
            children: <Widget>[
              Container(
                  height: 70,
                  alignment: Alignment.center,
                  child: Text("Dishwasher")),
              Container(height: 3, color: Colors.grey),
              Container(
                  height: 70,
                  alignment: Alignment.center,
                  child: Text("Washing machine")),
              Container(height: 3, color: Colors.grey),
              Container(
                  height: 70,
                  alignment: Alignment.center,
                  child: Text("Dryer")),
              Container(height: 3, color: Colors.grey),
              Container(
                  height: 70,
                  alignment: Alignment.center,
                  child: Text("Fridge"))
            ],
          ),
        ),
      ],
    );
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
  List<charts.Series<ConsumerData, int>> seriesList =
      new List<charts.Series<ConsumerData, int>>();
  bool ready = false;

  loadAssetData() async {
    print("start loading: " + DateTime.now().toIso8601String());
    final myData = await rootBundle.loadString("assets/power_sample.csv");
    List<List<dynamic>> csvTable =
        CsvToListConverter(eol: '\n').convert(myData);
    data = csvTable;
    print("finish loading loading: " + DateTime.now().toIso8601String());
    createSeries();
  }

  createSeries() {
    List<ConsumerData> dishwasherList = new List<ConsumerData>();
    List<ConsumerData> washList = new List<ConsumerData>();
    List<ConsumerData> dryerList = new List<ConsumerData>();
    //List<ConsumerData> overallList = new List<ConsumerData>();
    for (int i = 1; i < 25; i++) {
      int timeDi = int.parse(data[i][0].substring(11, 13));
      int consumptionDi = data[i][1].round();
      dishwasherList.add(new ConsumerData(timeDi, consumptionDi));

      int timeW = int.parse(data[i][0].substring(11, 13));
      int consumptionW = data[i][2].round();
      washList.add(new ConsumerData(timeW, consumptionW));

      int timeDr = int.parse(data[i][0].substring(11, 13));
      int consumptionDr = data[i][3].round();
      dryerList.add(new ConsumerData(timeDr, consumptionDr));

    /*  int timeAll = int.parse(data[i][0].substring(11, 13));
      int consumptionAll = data[i][4].round();
      dryerList.add(new ConsumerData(timeAll, consumptionAll));*/
    }
    print("LIST IS READY CALCULATED" + DateTime.now().toIso8601String());
    //geschirr
    seriesList.add(new charts.Series<ConsumerData, int>(
      id: "Dishwasher",
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      //areaColorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault.lighter,
      domainFn: (ConsumerData dataC, _) => dataC.timestamp,
      measureFn: (ConsumerData dataC, _) => dataC.consumption,
      data: dishwasherList,
    ));
    seriesList.add(new charts.Series<ConsumerData, int>(
      id: "Wash",
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      //areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,
      domainFn: (ConsumerData dataC, _) => dataC.timestamp,
      measureFn: (ConsumerData dataC, _) => dataC.consumption,
      data: washList,
    ));
    seriesList.add(new charts.Series<ConsumerData, int>(
      id: "Dryer",
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      //areaColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.lighter,
      domainFn: (ConsumerData dataC, _) => dataC.timestamp,
      measureFn: (ConsumerData dataC, _) => dataC.consumption,
      data: dryerList,
    ));
/*    seriesList.add(new charts.Series<ConsumerData, int>(
      id: "All",
      colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
      //areaColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.lighter,
      domainFn: (ConsumerData dataC, _) => dataC.timestamp,
      measureFn: (ConsumerData dataC, _) => dataC.consumption,
      data: overallList,
    ));*/
    print("series ready: " + DateTime.now().toIso8601String());
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
  final List<charts.Series<ConsumerData, int>> seriesList;

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
  final int timestamp; //[3.10]
  final int consumption;

  ConsumerData(this.timestamp, this.consumption);
}
