import 'package:flutter/material.dart';
import 'package:beautyapp/pages/LoginPage.dart';
import 'package:flutter/services.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:email_validator/email_validator.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

import '../../uidata.dart';

// username : test
// email : test@gmail.com
// password : 1#Firebase

class LoginPageState extends State<LoginPage> {
  
  bool isLoginPage = true;
  final _formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  authenticate(context) {
    final validity = _formkey.currentState!.validate();

    if (validity) {
      _formkey.currentState!.save();

      submitForm(emailController.text, passwordController.text,
          usernameController.text, context);
    }
  }

  Future submitForm(
      String email, String password, String username, context) async {
    final auth = FirebaseAuth.instance;

    UserCredential authResult;

    try {
      if (isLoginPage) {
        //login
        authResult = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        Navigator.pushNamed(context, "/BasePage");
      } else {
        //signup
        authResult = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String uid = authResult.user!.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .set({username: username, email: email});
      }
    } catch (error) {
      print('errorrrrrrrrrrrrrr');
      print(error);
    }
  }
  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
        appBar: AppBar(
          title: isLoginPage ? Text('Login') : Text('Signup'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                if (!isLoginPage)
                  SizedBox(
                    height: 10,
                  ),
                if (!isLoginPage)
                  TextFormField(
                    controller: usernameController,
                    //keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "UserName is required!";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter UserName"),
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Email",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (value) {
                    final bool validPass = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value!);
                    if (!validPass) {
                      return "Enter valid Password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Password",
                  ),
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
                    child: isLoginPage ? Text('Login') : Text('Signup'),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLoginPage = !isLoginPage;
                    });
                  },
                  child: isLoginPage
                      ? Text('Not a member?')
                      : Text('Already a member?'),
                )
              ],
            ),
          ),
        ));
  }
}
