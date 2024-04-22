import 'package:beautyapp/pages/ProductDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:beautyapp/pages/BasePage.dart';
import 'package:beautyapp/pages/SettingPage.dart';
import 'package:beautyapp/pages/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      //home: const LoginPage(), 
      initialRoute: '/',
      routes: {
        '/LoginPage': (context) => const LoginPage(),
        '/BasePage': (context) => const BasePage(),
        //'/ProductDetailPage': (context) => const ProductDetailPage(),
      },
    );   
  }  
}