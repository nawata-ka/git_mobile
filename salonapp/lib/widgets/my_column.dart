import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  final String columnImg, columnTxt,columnTxt2;
  final Color columnBg;

  const MyColumn({Key ?key, required this.columnImg, required this.columnTxt, required this.columnTxt2,required this.columnBg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: columnBg,
          ),
          child: Image(image: AssetImage(columnImg), fit: BoxFit.contain),
        ),
        SizedBox(height: 10),
        Text(columnTxt),
        SizedBox(height: 10),
        Text(columnTxt2),
      ],
    );
  }
}
