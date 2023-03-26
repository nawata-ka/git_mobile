import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveData extends StatefulWidget {
  const SaveData({Key?  key}) : super(key: key);

  @override
  _SaveDataState createState() => _SaveDataState();
}

class _SaveDataState extends State<SaveData> {
  late SharedPreferences sharedPreference; // Creating object of SharedPreferences class.
  @override
  void initState() {
    loadSharedPreferences();
    super.initState();
  }

  loadSharedPreferences() async {
    sharedPreference = await SharedPreferences.getInstance(); //Instantiating the object of SharedPreferences class.
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
}
}