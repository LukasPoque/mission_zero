import 'package:flutter/material.dart';
import 'package:mission_zero/history_page.dart';
import 'package:mission_zero/home_page.dart';
import 'package:mission_zero/schedule_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco Flex',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: BasicPage(title: 'Mission Zero'),
    );
  }
}

class BasicPage extends StatefulWidget {
  BasicPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _BasicPageState();
  }
}

class _BasicPageState extends State<BasicPage> {
  PageController _pageController;
  int _index = 0;
  bool _isVisible = true;
  List<SchedulerData> transData = new List<SchedulerData>();

  void onNewSchedulerData(SchedulerData data){
    setState(() {
      transData.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eco Flex',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: new PageView(
        children: [
          new SchedulePage(onNewSchedulerData),
          new HomePage(transData, onNewSchedulerData),
          new HistoryPage()
        ],
        controller: _pageController,
        onPageChanged: onIndexChanged,
      ),
      floatingActionButton: new Visibility(
        visible: _isVisible,
        child: new FloatingActionButton(
          onPressed: () {}, //TODO: add new consumer
          tooltip: 'Add',
          child: new Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm_on),
              title: Text('Schedule',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title:
                new Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.history),
            title: new Text('History',
                style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onIndexChanged(int index) {
    if(index == 0){
      _isVisible = true;
    } else {
      _isVisible = false;
    }
    setState(() {
      this._index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}

class SchedulerData{
  String time;
  String schedulerName;
  
  SchedulerData(this.time,this.schedulerName);
}