import 'package:beautyapp/Products.dart';
import 'package:beautyapp/pages/AddReviewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:beautyapp/pages/ProductDetailPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// For Row:
// mainAxisAlignment = Horizontal Axis
// crossAxisAlignment = Vertical Axis
// For Column:
// mainAxisAlignment = Vertical Axis
// crossAxisAlignment = Horizontal Axis

class ProductDetailPageState extends State<ProductDetailPage> {
  int likeCount = 0;
  bool isLiked = false;


  void initState() {
    super.initState();
    isLiked = widget.like;
    //getLike();
  }
  // Create a CollectionReference called users that references the firestore collection

  CollectionReference likes =
      FirebaseFirestore.instance.collection('likes');
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<void> addLike(bool like) {
    // Call the user's CollectionReference to add a likes
    return likes
        .add({
          'id': widget.id,
          'user_id': widget.user_id,
          'like': like,
          'datetime' :DateTime.now(),
        })
        .then((value) => print("Liked"))
        .catchError((error) => print("Failed to add like: $error"));
  }

    Future<void> updateLike(bool like) {
    // Call the user's CollectionReference to add a likes
    print(widget.id);
    return products
    .doc(widget.id)
    .update({'like': like})
    .then((value) => print("Like Updated"))
    .catchError((error) => print("Failed to update like: $error"));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //title: Text(widget.name),
            ),
        body: Column(
          children: [
            //Col1
            Image.asset(
              'images/lip_gloss.jpg',
              height: 180,
              width: 180,
            ),
            //Col2
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Row1
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Col1
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      //Col2
                      Text(
                        widget.brand,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      //Col3
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: RatingBarIndicator(
                          rating: 4.1,
                          itemCount: 5,
                          itemSize: 20.0,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Row2
                  Text(
                    "\$" + widget.price.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.pink,
                    ),
                  ),
                  //Row3
                  SizedBox(
                    width: 100.0,
                    child:
                        // Icon(
                        //   Icons.favorite,
                        //   color: Colors.pink[500],
                        //   size: 30,
                        // ),
                        IconButton(
                      onPressed: () {
                        setState(() {
                        
                          isLiked = !isLiked;
                          //addLike(isLiked);
                          updateLike(isLiked);

                        });
                      },
                      icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_outline),
                    ),
                  ),
                ],
              ),
            ),

            //Col3
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
                          widget.description,
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Col4
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
                            "Review",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        //col1
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => new AddReviewPage(
                                    user_id: widget.user_id,
                                    product_id: widget.id,
                                    user_name: widget.user_name,
                                  ),
                                ),
                              );
                            },
                            child: const Text("Add Review")),
                        SizedBox(
                            height: 200,
                            child: StreamBuilder(
                                // stream: FirebaseFirestore.instance
                                //     .collection("reviews")
                                //     .snapshots(),
                                stream: FirebaseFirestore.instance
                                    .collection("reviews")
                                    .where("id", isEqualTo: widget.id)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container(
                                        child: CircularProgressIndicator());
                                  } else {
                                    final docs = snapshot.data!.docs;

                                    return ListView.builder(
                                        padding: const EdgeInsets.all(8),
                                        itemCount: docs.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.account_circle,
                                                    color: Colors.grey,
                                                    size: 30,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(docs[index]
                                                        ["user_name"]),
                                                  ),
                                                ],
                                              ),
                                              //col2
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: RatingBarIndicator(
                                                  rating: 4.1,
                                                  itemCount: 5,
                                                  itemSize: 20.0,
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.pink,
                                                  ),
                                                ),
                                              ),
                                              //col3
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Text(
                                                    docs[index]["comment"]),
                                              ),
                                            ],
                                          );
                                        });
                                  }
                                }))
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

//Review
//   StreamBuilder(
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return Container(child: CircularProgressIndicator());
//     } else {
//       final docs = snapshot.data!.docs;

//       return ListView.builder(
//           itemBuilder: ((context, index) {
//             return Card(
//                 child: InkWell(
//                     child: Row(
//                       children: <Widget>[
//                         Column(
//                           children: [
//                             Text(
//                               docs[index]["comment"],
//                             ),
//                             Text(docs[index]["user_id"]),
//                             RatingBarIndicator(
//                               rating: 4.1,
//                               itemCount: 5,
//                               itemSize: 20.0,
//                               physics: BouncingScrollPhysics(),
//                               itemBuilder: (context, _) => Icon(
//                                 Icons.star,
//                                 color: Colors.pink,
//                               ),
//                             ),
//                             //Text('Line2',
//                             //    textAlign: TextAlign.left),
//                           ],
//                         ),
//                         //),
//                       ],
//                     )));
//           }),
//           itemCount: docs.length);
//     }
//   },
//   stream:
//       FirebaseFirestore.instance.collection("reviews").snapshots(),
// ),
