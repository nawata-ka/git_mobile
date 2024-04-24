
import 'package:beautyapp/pages/ProductDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:beautyapp/pages/LikePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LikePageState extends State<LikePage> {
  String uid = "";
  String uname = "";

  // int likeCount = 0;
  // bool isLiked = false;

  void initState() {
    super.initState();
    getUID();
    //getLike();
  }

  getUID() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    setState(() {
      uid = user!.uid;
      uname = user.email!;
      uname = uname.split("@").first;
      print(uid);
      print(uname);
    });
  }

  // getLike() {
  //   setState(() {
  //     this.isLiked = isLiked;
  //     likeCount += this.isLiked ? 1 : -1;

  //   });
  //     print(isLiked);
  //     print(likeCount);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            final docs = snapshot.data!.docs;
            return ListView.builder(
                itemBuilder: ((context, index) {
                
                  return Card(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => new ProductDetailPage(
                                  name: docs[index]["name"],
                                  brand: docs[index]["brand"],
                                  price: docs[index]["price"],
                                  description: docs[index]["description"],
                                  like:docs[index]["like"],
                                  user_id: uid,
                                  user_name: uname,
                                  id: docs[index]["id"],
                                ),
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
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                'images/lip_gloss.jpg',
                                height: 150,
                                width: 150,
                                //fit: BoxFit.cover,
                              ),
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    docs[index]["name"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Text(docs[index]["brand"]),
                                  Row(
                                    children: [
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
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text("4"),
                                      ),
                                    ],
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
        stream: FirebaseFirestore.instance.collection("products")
        .where("like",isEqualTo: true)
        .snapshots(),
        //stream: FirebaseFirestore.instance.collection("products")

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
