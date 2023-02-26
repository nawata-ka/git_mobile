import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Browse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Browse'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
      //padding: const EdgeInsets.all(15),
      children: <Widget>[
        Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 10.0,
                    ),
                  )
                ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 2.0,
                    ),
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,           
                  children: [
                    const Text(
                      'Kia Sorento',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    const Text(
                      '€45/day',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                            'images/Pic1.png',
                            height: 130,
                            width: 180,
                            fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [
                        Row(                  
                          children: const [
                            Icon(Icons.directions_car,color: Colors.blue),
                            Text(" Standard",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                        Row( 
                          children: const [
                            Icon(Icons.settings,color: Colors.blue),
                            Text(" Manual Transmission   ",style: TextStyle(fontSize: 17,),),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit,color: Colors.blue),
                            Text(" Yes",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 10.0,
                    ),
                  )
                ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 2.0,
                    ),
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,           
                  children: [
                    const Text(
                      'Ford KA',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    const Text(
                      '€44/day',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                        'images/Pic2.png',
                        height: 130,
                        width: 180,
                        fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [
                        Row(                  
                          children: const [
                            Icon(Icons.directions_car,color: Colors.blue),
                            Text(" Luxury",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                        Row( 
                          children: const [
                            Icon(Icons.settings,color: Colors.blue),
                            Text(" Automatic Transmission",style: TextStyle(fontSize: 17)),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit,color: Colors.blue),
                            Text(" Yes",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]
          ),
        ),
               Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 10.0,
                    ),
                  )
                ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 2.0,
                    ),
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,           
                  children: [
                    const Text(
                      'Kia Sorento',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    const Text(
                      '€45/day',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                            'images/Pic1.png',
                            height: 130,
                            width: 180,
                            fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [
                        Row(                  
                          children: const [
                            Icon(Icons.directions_car,color: Colors.blue),
                            Text(" Standard",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                        Row( 
                          children: const [
                            Icon(Icons.settings,color: Colors.blue),
                            Text(" Manual Transmission   ",style: TextStyle(fontSize: 17,),),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit,color: Colors.blue),
                            Text(" Yes",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 10.0,
                    ),
                  )
                ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 2.0,
                    ),
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,           
                  children: [
                    const Text(
                      'Ford KA',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    const Text(
                      '€44/day',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                        'images/Pic2.png',
                        height: 130,
                        width: 180,
                        fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [
                        Row(                  
                          children: const [
                            Icon(Icons.directions_car,color: Colors.blue),
                            Text(" Luxury",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                        Row( 
                          children: const [
                            Icon(Icons.settings,color: Colors.blue),
                            Text(" Automatic Transmission",style: TextStyle(fontSize: 17)),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit,color: Colors.blue),
                            Text(" Yes",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]
          ),
        ),
                Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 10.0,
                    ),
                  )
                ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 2.0,
                    ),
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,           
                  children: [
                    const Text(
                      'Kia Sorento',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    const Text(
                      '€45/day',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                            'images/Pic1.png',
                            height: 130,
                            width: 180,
                            fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [
                        Row(                  
                          children: const [
                            Icon(Icons.directions_car,color: Colors.blue),
                            Text(" Standard",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                        Row( 
                          children: const [
                            Icon(Icons.settings,color: Colors.blue),
                            Text(" Manual Transmission   ",style: TextStyle(fontSize: 17,),),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit,color: Colors.blue),
                            Text(" Yes",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 10.0,
                    ),
                  )
                ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 229, 230, 232),
                      width: 2.0,
                    ),
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,           
                  children: [
                    const Text(
                      'Ford KA',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    const Text(
                      '€44/day',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                        'images/Pic2.png',
                        height: 130,
                        width: 180,
                        fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,  
                      children: [
                        Row(                  
                          children: const [
                            Icon(Icons.directions_car,color: Colors.blue),
                            Text(" Luxury",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                        Row( 
                          children: const [
                            Icon(Icons.settings,color: Colors.blue),
                            Text(" Automatic Transmission",style: TextStyle(fontSize: 17)),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit,color: Colors.blue),
                            Text(" Yes",style: TextStyle(fontSize: 17,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]
          ),
        ),
      ],
      )
    );
  }
}
