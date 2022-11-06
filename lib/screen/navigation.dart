import 'package:doctor/page/alarm.dart';
import 'package:doctor/page/history.dart';
import 'package:doctor/page/home.dart';
import 'package:doctor/page/profile.dart';
import 'package:doctor/page/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AlarmPage(),
    Profile(),
    History(),
    Video(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      SystemNavigator.pop();

      return Future.value(false);
    }
    return Future.value(true);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WillPopScope(
        onWillPop: onWillPop ,
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF0D47A1),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.home, color: Colors.white),
                label: 'Home',
                backgroundColor: Colors.blue[800]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.alarm, color: Colors.white),
                label: 'Alarm',
                backgroundColor: Colors.blue[800]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person, color: Colors.white),
                label: 'Profile',
                backgroundColor: Colors.blue[800]),
            BottomNavigationBarItem(
              icon: const Icon(Icons.history, color: Colors.white),
              label: 'History',
              backgroundColor: Colors.blue[800],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.video_collection, color: Colors.white),
              label: 'Videos',
              backgroundColor: Colors.blue[800],
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          iconSize: 25,
          onTap: _onItemTapped,
          // fixedColor: Colors.lightGreen,
          elevation: 5),
    );
  }
}
