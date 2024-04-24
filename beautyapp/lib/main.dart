import 'package:beautyapp/Products.dart';
import 'package:beautyapp/pages/LikePage.dart';
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
      //home: const BasePage(), 
      home: const LoginPage(), 
      //initialRoute: '/',
      routes: {
        '/LoginPage': (context) => const LoginPage(),
        '/BasePage': (context) => const BasePage(),
        //'/ProductDetailPage': (context) => const ProductDetailPage(test1: "aaaa", test: "2222",),
        // /ProductDetailPage

        
      },

      // onGenerateRoute: (settings) {
      //   // If you push the PassArguments route
      //   if (settings.name == ProductDetailPage.routeName) {
      //     // Cast the arguments to the correct
      //     // type: ScreenArguments.
      //     final args = settings.arguments as Arguments;

      //     // Then, extract the required data from
      //     // the arguments and pass the data to the
      //     // correct screen.
      //     return MaterialPageRoute(
      //       builder: (context) {
      //         return ProductDetailPage(
      //           title: args.title,
      //           message: args.message,
      //         );
      //       },
      //     );
      //   }
      //   // The code only supports
      //   // PassArgumentsScreen.routeName right now.
      //   // Other values need to be implemented if we
      //   // add them. The assertion here will help remind
      //   // us of that higher up in the call stack, since
      //   // this assertion would otherwise fire somewhere
      //   // in the framework.
      //   assert(false, 'Need to implement ${settings.name}');
      //   return null;
      // },


    );   
  }  
}