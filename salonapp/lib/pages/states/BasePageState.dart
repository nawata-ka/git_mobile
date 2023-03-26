import 'package:flutter/material.dart';
import 'package:salonapp/pages/BasePage.dart';
import 'package:salonapp/pages/HistoryPage.dart';
import 'package:salonapp/pages/HomePage.dart';
import 'package:salonapp/pages/SettingPage.dart';

class BasePageState extends State<BasePage> {
   int _selectedIndex = 1;
   String _title = "Hitory";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0)
      {
        _title ="Home";
      }
      else if(_selectedIndex == 1)
      {
        _title = "History";
      }
      else
      {
        _title = "Setting";
      }
    });
  }

    final pages = [
    const HomePage(),
    const HistoryPage(),
    const SettingPage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcom to our Salon App',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(_title),
          ),
          body: 
        //child: _widgetOptions.elementAt(_selectedIndex),
          pages[_selectedIndex],      
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber,
            onTap: _onItemTapped,
          ),
        ),
      );
  }
}