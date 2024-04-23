import 'package:beautyapp/arguments.dart';
import 'package:flutter/material.dart';
import 'package:beautyapp/pages/ProductDetailPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';


class ProductDetailPageState extends State<ProductDetailPage> {



  @override
  Widget build(BuildContext context) {

    //final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    // print(args);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        
        body: Column(
              children: [
                Image.asset(
                  'images/lip_gloss.jpg',
                  height: 180,
                  width: 180,
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Row(
                    children: [
                      Expanded(
                        /*1*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                "Lip Gloss",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Text(
                              "brand name",
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*3*/
                      Icon(
                        Icons.star,
                        color: Colors.red[500],
                      ),
                      const Text('41'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Row(
                    children: [
                      Expanded(
                        /*1*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                "Description",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Text(
                              "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
            
                            //Review
                            SizedBox(
                                height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                  "Review",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                
                            ),
            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            
              ],
            ));
  }
}
