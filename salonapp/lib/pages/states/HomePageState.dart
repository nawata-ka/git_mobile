import 'package:flutter/material.dart';
import 'package:salonapp/pages/HomePage.dart';
import 'package:salonapp/pages/BookingPage.dart';
import 'package:salonapp/pages/Page2.dart';
import 'package:salonapp/pages/Page3.dart';

class HomePageState extends State<HomePage> {
   int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    final pages = [
    const Page2(),
    const BookingPage(),
    const Page3(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Booking',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Booking'),
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
                icon: Icon(Icons.business),
                label: 'Reservation',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
      );
  }
}