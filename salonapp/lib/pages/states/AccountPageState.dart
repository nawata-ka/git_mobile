import 'package:flutter/material.dart';
import 'package:salonapp/pages/AccountPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPageState extends State<AccountPage>{
  String? _counter;
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  
  void _incrementCounter() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _counter = pref.getString("my_string_name");
      pref.setString('my_string_name', _counter!);
    });
  }


  @override
  void initState(){
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async{
    final pref = await SharedPreferences.getInstance();
    
    setState(() {
      _counter = pref.getString('my_string_name');

      print(_counter);
    });

  }
  
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return MaterialApp(
        title: 'Account',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
           appBar: AppBar(
            title: const Text('Account'),
            leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.white),
            onPressed: (
              
            ) => Navigator.pop(context)),
          ),
          body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _counter,
                decoration: InputDecoration(
                  labelText: "Account"
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      _incrementCounter();
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      //ScaffoldMessenger.of(context).showSnackBar(
                      //  const SnackBar(content: Text('Processing Data')),
                      //);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        )
    )
    );
  } 
}

_save(String value) async {
final prefs = await SharedPreferences.getInstance();
final key = 'my_string_name';
//final value = "";
prefs.setString(key, value);
print('saved $value');
}
