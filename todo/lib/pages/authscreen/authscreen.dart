import "package:flutter/material.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _authScreenState();
}

class _authScreenState extends State<AuthScreen> {
  bool isLoginPage = false;
  //final can be set without specfic value.

  final _formkey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  
  authenticate(context)
  {
    final validity = _formkey.currentState!.validate();
    if(validity){
      _formkey.currentState!.save();
      //print("test");
      submitForm(userNameController.text, emailController.text, passwordController.text, context);
    }

  }

  Future submitForm(String username, String email, String password, context) async {
    final auth = FirebaseAuth.instance;
    UserCredential authResult;
    //print('submitForm');

    try{
      if(isLoginPage)
      {
        //login
        authResult =  await auth.signInWithEmailAndPassword(email: email, password: password);
        
      }
      else{
        //Sign up
        authResult =  await auth.createUserWithEmailAndPassword(email: email, password: password);
        String uid = authResult.user!.uid;
        await FirebaseFirestore.instance.collection('users').doc(uid).set({username:username,email:email});

      }
    }
    catch(error){
      print('error');
      print(error);
    }
    //username : test
    //email : test@email.com
    //password : 1#Firebase
    

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: isLoginPage ? Text("Login"):  Text("Sign Up"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _formkey,
              child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              if(!isLoginPage)
              TextFormField(
                controller: userNameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "User name is required!";
                  }
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter User Name"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  if (!emailValid) {
                    return "Enter valid email address";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter e-mail address"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) {
                  // final bool validPass = RegExp(
                  //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                  //     .hasMatch(value!);

                  //if (!validPass) {
                  if (value!.isEmpty) {
                    return "Enter valid Password!";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter Password"),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    authenticate(context);
                  },
                  child: isLoginPage ? Text("Login"):  Text("Sign Up"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLoginPage = !isLoginPage;
                  });
                },
                child: isLoginPage
                    ? Text("Not a member?")
                    : Text("Already a member?"),
              )
            ],
          )),
        ));
  }
}
