import 'package:beautyapp/pages/ProductDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:beautyapp/pages/RankingPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RankingPageState extends State<RankingPage> {
  String uid = "";
  String uname = "";
 final controller = SearchController();
  String queryText = "";
  
//   // Get a non-default Storage bucket
// final storage = FirebaseStorage.instanceFor(bucket: "gs://beautyapp-d64af.appspot.com");
// // Create a storage reference from our app
// final storageRef = FirebaseStorage.instance.ref();
// // Create a reference with an initial file path and name
// final pathReference = storageRef.child("images/stars.jpg");
// Create a reference to a file from a Google Cloud Storage URI
final gsReference =
    FirebaseStorage.instance.refFromURL("gs://beautyapp-d64af.appspot.com/lip_gloss.jpg");
 
 
 //final serachController = serchbar();
  // int likeCount = 0;
  // bool isLiked = false;

  void initState() {
    super.initState();
    getUID();
    queryText = controller.text;


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(
        children: [
          SizedBox(height: 10,),
          
          SearchBar(
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {

              setState(() {
                print("queryText onTap.");
                queryText = controller.text;
              });
              //print("queryText onTap.");
              //queryText = controller.text;
              //queryText = controller.text;
              //controller.openView();
            },
            onChanged: (_) {
              //controller.openView();
              // setState(() {
              //   print("queryText chenged.");
              //   queryText = controller.text;
              // });

            },
            leading: const Icon(Icons.search),
            trailing: <Widget>[
              // Tooltip(
              //   message: 'Change brightness mode',
              //   child: IconButton(
              //     isSelected: isDark,
              //     onPressed: () {
              //       setState(() {
              //         isDark = !isDark;
              //       });
              //     },
              //     icon: const Icon(Icons.wb_sunny_outlined),
              //     selectedIcon: const Icon(Icons.brightness_2_outlined),
              //   ),
              // )
            ],
          ),

          // TextFormField(
          //         //controller: commentController,
          //         keyboardType: TextInputType.text,
          //         validator: (value) {
          //           if (value!.isEmpty) {
          //             return "Search";
          //           }
          //           return null;
          //         },
          //         decoration: InputDecoration(
          //           border: OutlineInputBorder(),
          //           labelText: "Enter product or brand name",
          //         ),
          //       ),
          Expanded(
            child: StreamBuilder(
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
                                        like: docs[index]["like"],
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
                                      //gsReference as String,
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
              stream: 
              (queryText!= null && queryText!= "" )?FirebaseFirestore.instance
                  .collection("products")
                  .where("name", isEqualTo: queryText)
                  .snapshots()
                :FirebaseFirestore.instance
                  .collection("products")
                  //.where("name", isEqualTo: "Lip gloss")
                  .snapshots()
              //stream: FirebaseFirestore.instance.collection("products")
            ),
          ),
        ],
      ),
    );
  }
}
