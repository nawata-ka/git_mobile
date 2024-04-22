import 'package:flutter/material.dart';
import 'package:beautyapp/pages/BasePage.dart';
import 'package:beautyapp/pages/HomePage.dart';
import 'package:beautyapp/pages/RankingPage.dart';
import 'package:beautyapp/pages/LikePage.dart';
import 'package:beautyapp/pages/SettingPage.dart';

class BasePageState extends State<BasePage> {
   int _selectedIndex = 2;
   String _title = "Like";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0)
      {
        _title ="Home";
      }
      else if(_selectedIndex == 1)
      {
        _title = "Ranking";
      }
      else if(_selectedIndex == 2)
      {
        _title = "Like";
      }
      else
      {
        _title = "Setting";
      }
    });
  }

    final pages = [
    const HomePage(),
    const RankingPage(),
    const LikePage(),
    const SettingPage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcom to our Beauty App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
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
                label: 'Ranking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Like',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.pink,
            onTap: _onItemTapped,
          ),
        ),
      );
  }
}