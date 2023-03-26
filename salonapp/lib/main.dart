import 'package:flutter/material.dart';
import 'package:salonapp/pages/BasePage.dart';
import 'package:salonapp/pages/BookingPage.dart';
import 'package:salonapp/pages/AccountPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty salon app',
      home: const BasePage(), 
      initialRoute: '/',
      routes: {
        '/BookingPage': (context) => const BookingPage(),
        '/AccountPage': (context) => const AccountPage(),
      },
    );   
  }  
}