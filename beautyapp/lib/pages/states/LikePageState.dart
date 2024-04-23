import 'package:beautyapp/arguments.dart';
import 'package:beautyapp/pages/ProductDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:beautyapp/pages/LikePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LikePageState extends State<LikePage> {
  String uid = "";
  bool like = false;

  void initState() {
    super.initState();
    getUID();
    //getlike();
  }

  getUID() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    setState(() {
      uid = user!.uid;
    });
  }
  // getlike() {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = auth.currentUser;
  //   setState(() {
  //     like = user!.uid;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(child: CircularProgressIndicator());
          } else {
            final docs = snapshot.data!.docs;

            return ListView.builder(
                itemBuilder: ((context, index) {
// Card(
//             child: ListTile(
//               leading: FlutterLogo(size: 56.0),
//               title: Text('Two-line ListTile'),
//               subtitle: Text('Here is a second line'),
//               trailing: Icon(Icons.more_vert),
//             ),
//           ),

                  //   return Card(
                  //     child: ListTile(
                  //       leading: const FlutterLogo(size: 70.0),//Todo get image from storage
                  //       title: Text(docs[index]["name"]),
                  //       subtitle: Text(docs[index]["brand"]),

                  //       trailing: IconButton(
                  //         icon: Icon(Icons.delete),
                  //         onPressed:(){
                  //           Navigator.pushNamed(context, "/ProductDetailPage");
                  //         })
                  //     ),
                  //   );
                  // }),

                  return Card(
                      child: InkWell(
                          onTap: () {
                            //Navigator.pushNamed(context, "/ProductDetailPage");

                  // Navigator.of(context, rootNavigator: true).pushNamed("/ProductDetailPage",
                  //                      arguments:(
                  //                    'product_id','bbb',
                  //                  ), 
                  //                 );

                            // Navigator.pushNamed(
                            //       context,
                            //       ProductDetailPage.routeName,
                            //       arguments: Arguments(
                            //         'productname',
                            //         'bbbb',
                            //       ),
                            //     );

                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => new ProductDetailPage(title: "aaaa", message: "bbbb",),
                                ),
                              );

                            // Navigator.pushNamed(
                            //   context,
                            //   ProductDetailPage.routeName,
                            //   arguments: Arguments(
                            //     'Product_id',
                            //     'test',
                            //   ),
                            // );

                          },
                          child: Row(
                            children: <Widget>[
                              // Expanded(
                              //   child:
                              Image.asset(
                                'images/lip_gloss.jpg',
                                height: 180,
                                width: 180,
                                //fit: BoxFit.cover,
                              ),
                              //),
                              // Expanded(
                              //   child:
                              Column(
                                children: [
                                  Text(
                                    docs[index]["name"],
                                  ),
                                  Text(docs[index]["brand"]),
                                  RatingBarIndicator(
                                    rating: 4.1,
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  //Text('Line2',
                                  //    textAlign: TextAlign.left),
                                ],
                              ),
                              //),
                            ],
                          )));
                }),
                itemCount: docs.length);
          }
        },
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
      ),
    );
  }
}

Card buildCard(String sdate) {
  var heading = sdate;
  var subheading = 'Stylist by Anny Roy';
  var supportingText = 'Menu: Hair cut';
  return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(heading),
            subtitle: Text(subheading),
            //trailing: Icon(Icons.favorite_outline),
          ),
          Image.asset(
            'images/haircutpic.png',
            height: 200,
            //width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(supportingText),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text('Cancel '),
                onPressed: () {/* ... */},
              ),
              TextButton(
                child: const Text('Resuchdule'),
                onPressed: () {/* ... */},
              )
            ],
          )
        ],
      ));
}

Card pastbuildCard(String sdate) {
  var heading = sdate;
  var subheading = 'Stylist by Anny Roy';
  var supportingText = 'Menu: Hair cut';
  return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(heading),
            subtitle: Text(subheading),
            //trailing: Icon(Icons.favorite_outline),
          ),
          Image.asset(
            'images/haircutpic.png',
            height: 200,
            //width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(supportingText),
          ),
        ],
      ));
}

//  @override
//  Widget build(BuildContext context) {
//        return Scaffold(
//       body: StreamBuilder(
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Container(child: CircularProgressIndicator());
//           } else {
//             final docs = snapshot.data!.docs;

//             return ListView.builder(
//                 itemBuilder: ((context, index) {
//                   var icon;
//                   if(docs[index]["like"] == false){
//                     icon = Icon(Icons.favorite,color:Colors.grey);
//                   }
//                   else{
//                     icon = Icon(Icons.favorite,color:Colors.pink);
//                   }

//                   return ListTile(
//                     title: Text(docs[index]["name"]),
//                     subtitle: Text(docs[index]["brand"]),
//                     trailing: IconButton(
//                       icon: icon,
//                       onPressed:(){
//                          FirebaseFirestore.instance
//                          .collection("products")
//                          .doc(docs[index]["id"])
//                          .update({'like': true});
//                       })
//                   );
//                 }),
//                 itemCount: docs.length);
//           }
//         },
//         stream: FirebaseFirestore.instance
//             .collection("products")
//             .snapshots(),
//       ),
//     );
//  }
// }
