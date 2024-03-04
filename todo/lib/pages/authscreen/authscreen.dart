import "package:flutter/material.dart";

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _authScreenState();
}

class _authScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login/Signup"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
              child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                validator: (value) 
                {
                  if(value!.isEmpty)
                  {
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
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) 
                {
                  if(value!.isEmpty)
                  {
                    return "Password is required!";
                  }
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter Password"),
              )
            ],
          )),
        ));
  }
}
