import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(     
      title: 'Sign up',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),

      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmpasswordController = TextEditingController();

    void printLatestValues(){
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
      print('Confirm password: ${confirmpasswordController.text}');
    }

    @override
    initState(){
      super.initState();
      emailController.addListener(printLatestValues);
      passwordController.addListener(printLatestValues);
      confirmpasswordController.addListener(printLatestValues);

    }
    @override
    void dispose(){
      emailController.dispose();
      passwordController.dispose();
      confirmpasswordController.dispose();

      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light
        ),
          backgroundColor: Colors.transparent,
          elevation: 0, // 1
          leading: const Icon(Icons.arrow_back,color: Colors.black,)
      ),
       body: 
      Form(
        key: _formkey,
        //child: Center(
        child: Container(
          margin: const EdgeInsets.all(30.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            const Center(
              child: Text(
                "Create an account. It's free.",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            const Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
            const SizedBox(
              height: 2,
            ),
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                ),
                validator:(value) {
                  final bool isValid = EmailValidator.validate(value!);
                  if(value!.isEmpty){
                    return "Please enter a valid Email";
                  }
                  else if(!isValid)
                  {
                    return "Please enter a valid Email format";
                  }
                  else{
                    return null;
                  }
                },
              ),
            
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
            const SizedBox(
              height: 2,
            ),
            TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                ),
                validator:(value) {
                  if(value!.isEmpty){
                    return "Please enter a valid Password";
                  }
                  else if(value.length < 6){
                    return "Password must be at least 6 characters long";
                  }
                  else{
                    return null;
                  }
                },
              ), 
              
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Comfirm password',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
            const SizedBox(
              height: 2,
            ),
            TextFormField(
                controller: confirmpasswordController,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                ),
                validator:(value) {
                  if( value!.isEmpty){
                    return "Please enter a valid Confirm password";
                  }
                  else if(value != passwordController.text){
                    return "Not match password";
                  }
                  else{
                    return null;
                  }
                },
              ), 


            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (){
                  if(_formkey.currentState!.validate()){
                    printLatestValues();
                    print('submited');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent, //background color of button
                  side: const BorderSide(width:3, color:Colors.grey), //border width and color
                  elevation: 3, //elevation of button
                  minimumSize: const Size.fromHeight(50), 
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                  ),
                  padding: const EdgeInsets.all(20) //content padding inside button
                ),
                child: 
                  const Text("Sign up",style: TextStyle(color: Colors.black,),
                )
              ),

            const SizedBox(
              height: 20,
            ), 
            //Center(
            Center(
              child: RichText(
                text: const TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.black,),
                  children: <TextSpan>[
                    TextSpan(text: 'Login.', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),         
          ],
        ),
      ),
      )
    );
  }
}
