import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/auth_services.dart';

class TempForm extends StatefulWidget {
  const TempForm({Key key}) : super(key: key);

  @override
  _TempFormState createState() => _TempFormState();
}

class _TempFormState extends State<TempForm> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LOGIN / SIGN UP'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'EMAIL...'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'PASSWORD...'),
              ),
            ),
            Container(
              height: 40,
              color: Colors.blue,
              width: MediaQuery.of(context).size.width / 3,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

                  if (email.isEmpty) {
                    print('Email is empty');
                  } else {
                    if (password.isEmpty) {
                      print('password is empty');
                    } else {
                      context.read<AuthService>().login(email, password);
                    }
                  }
                },
                child: Text('LOG IN'),
              ),
            ),
            Container(
              height: 40,
              color: Colors.red,
              width: MediaQuery.of(context).size.width / 3,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

                  if (email.isEmpty) {
                    print('Email is empty');
                  } else {
                    if (password.isEmpty) {
                      print('password is empty');
                    } else {
                      context.read<AuthService>().signUp(email, password).then(
                        (value) 
                        async {
                          User user = FirebaseAuth.instance.currentUser;
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user.uid)
                              .set(
                            {
                              'uid': user.uid,
                              'email': email,
                              'password': password
                            },
                          );
                        },
                      );
                    }
                  }
                },
                child: Text('SIGN UP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
