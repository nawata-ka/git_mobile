import 'package:flutter/material.dart';
import 'package:salonapp/pages/HomePage.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),     
    );   
  }  
}