import 'package:flutter/material.dart';
import 'package:beautyapp/pages/HomePage.dart';
import 'package:beautyapp/uidata.dart';
import 'package:beautyapp/widgets/image_card.dart';
import 'package:beautyapp/widgets/my_column.dart';
import 'package:beautyapp/widgets/specialist_column.dart';

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final screen_size_width = MediaQuery.of(context).size.width;
    final screen_size_height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: 
      Container(
        width: screen_size_width,
        height: screen_size_height,
        padding: EdgeInsets.only(top:16, left:16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: screen_size_height * .2,
                  width: screen_size_width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ImageCard(cardImg: "images/braid4.jpg"),
                      SizedBox(width: 10),
                      ImageCard(cardImg: "images/braid3.jpg"),
                    ],
                  )),
              SizedBox(height: 15),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Text("Salon Menu",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600))),
                    TextButton(
                        onPressed: () {},
                        child: Text("View All",
                            style: TextStyle(color: Colors.black54)))
                  ]),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context, rootNavigator: true).pushNamed(UIData.SettingPageRoute),
                      child: MyColumn(
                        columnImg: "images/haircut.png",
                        columnTxt: "Haircut",
                        columnTxt2: r"$50",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(   
                      onTap: () =>
                          Navigator.of(context, rootNavigator: true).pushNamed(UIData.SettingPageRoute),
                          //Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: MyColumn(
                        columnImg: "images/braid.png",
                        columnTxt: "Braids",
                        columnTxt2: r"$60",
                        columnBg: UIData.lightColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context, rootNavigator: true).pushNamed(UIData.SettingPageRoute),
                      child: MyColumn(
                        columnImg: "images/shampoo.png",
                        columnTxt: "Shampoo",
                        columnTxt2: r'$20',
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context, rootNavigator: true).pushNamed(UIData.SettingPageRoute),
                      child: MyColumn(
                        columnImg: "images/blow.png",
                        columnTxt: "Blowdry",
                        columnTxt2: r"$15",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 6),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Text("Hair Specialists",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600))),
                    TextButton(
                        onPressed: () {},
                        child: Text("View All",
                            style: TextStyle(color: Colors.black54)))
                  ]),
              SizedBox(height: 6),
              Container(
                  height: 230,
                  width: screen_size_width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SpecialistColumn(
                          specImg: "images/braid2.jpg", specName: "Anny Roy"),
                      SizedBox(width: 12),
                      SpecialistColumn(
                          specImg: "images/profile.jpg", specName: "Joy Roy"),
                      SizedBox(width: 12),
                      SpecialistColumn(
                          specImg: "images/braid3.jpg",
                          specName: "Patience Roy"),
                    ],
                  ))
            ],
          ),
        ),
      ),   
    );
  }
}