import 'package:flutter/material.dart';
import 'package:beautyapp/pages/AddReviewPage.dart';
import 'package:flutter/services.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:email_validator/email_validator.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../uidata.dart';


class AddReviewPageState extends State<AddReviewPage> {
  final _formkey = GlobalKey<FormState>();
  final commentController = TextEditingController();
  double rate = 0 ;
 
     // Create a CollectionReference called users that references the firestore collection
    CollectionReference reviews = FirebaseFirestore.instance.collection('reviews');

    Future<void> addReview(double rate, String comment) {
      // Call the user's CollectionReference to add a new user
      return reviews
          .add({
            'rate': rate,
            'id': widget.product_id,
            'comment': comment,
            'user_id' :widget.user_id,
            'user_name':widget.user_name,
          })
          .then((value) => Navigator.pop(context))
          .catchError((error) => print("Failed to add review: $error"));
    }
 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Review"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                //Text(widget.user_id),
                //Text(widget.product_id),
                // if (!isLoginPage)
                //   SizedBox(
                //     height: 10,
                //   ),
                //if (!isLoginPage)
                // TextFormField(
                //   controller: usernameController,
                //   //keyboardType: TextInputType.name,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "UserName is required!";
                //     }
                //   },
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       labelText: "Enter UserName"),
                // ),

                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.pink,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                    rate = rating;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: commentController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Comment";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Comment",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      //authenticate(context);

                      addReview(rate, commentController.text);
                    },
                    child: Text('Add'),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ));
  }
}
