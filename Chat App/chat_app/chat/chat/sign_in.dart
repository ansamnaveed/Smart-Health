import 'dart:ui';
import 'package:chat_app/controllers/firebase_helper.dart';
import 'package:chat_app/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'const.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  FirebaseServices firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pagesColors,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Sign In',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: _email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.alternate_email,
                      ),
                      contentPadding: EdgeInsets.only(top: 15),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: _password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      contentPadding: EdgeInsets.only(top: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              child: Text('Sign In'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  firebaseServices.login_user(
                      context, _email.text, _password.text);
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Text('I don\'t have an Account?'),
                  ),
                  WidgetSpan(
                    child: InkWell(
                      onTap: () {
                        push(context, SignUp());
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
