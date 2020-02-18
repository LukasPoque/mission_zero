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
      title: 'Mission Zero',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mission Zero'),
      ),
      body: new PageView(
        children: [
          new HistoryPage(Colors.white),
          new HomePage(Colors.blue),
          new SchedulePage(Colors.grey)
        ],
        controller: _pageController,
        onPageChanged: onIndexChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.history),
            title: new Text('History'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm_on),
              title: Text('Schedule')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }

  void onIndexChanged(int index){
    setState((){
      this._index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }

}