import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/Models/auth_services.dart';
import 'package:fireauth/Views/Dashboard/dashboard.dart';
import 'package:fireauth/Widgets/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:relative_scale/relative_scale.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientText(
                  'Smart Health +',
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color.fromRGBO(65, 65, 67, 1),
                      Color.fromRGBO(239, 66, 54, 1),
                    ],
                  ),
                  style:
                      TextStyle(fontSize: sy(24), fontWeight: FontWeight.bold),
                ),
                Text(
                  "Register to see your plan",
                  style: TextStyle(
                    fontSize: sy(12),
                    color: Color.fromRGBO(65, 65, 67, 1),
                  ),
                )
              ],
            ),
            automaticallyImplyLeading: false,
            toolbarHeight: sy(75),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(sy(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: sy(20)),
                      child: Text(
                        'Email',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2.0,
                                spreadRadius: -1,
                                offset: Offset(1, 1),
                              )
                            ]),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: sx(20)),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(118, 129, 150, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: sx(20)),
                              child: Text(
                                'First Name',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 2.0,
                                        spreadRadius: -1,
                                        offset: Offset(1, 1),
                                      )
                                    ]),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  controller: fnameController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: sx(20)),
                                    hintText: "First Name",
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(118, 129, 150, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: sx(20)),
                              child: Text(
                                'Last Name',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 2.0,
                                        spreadRadius: -1,
                                        offset: Offset(1, 1),
                                      )
                                    ]),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  controller: lnameController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: sx(20)),
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(118, 129, 150, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: sx(20)),
                      child: Text(
                        'Password',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 2.0,
                              spreadRadius: -1,
                              offset: Offset(1, 1),
                            )
                          ],
                        ),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          obscuringCharacter: '.',
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: sx(20)),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(118, 129, 150, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 8),
                      child: gradientButton(
                        'Sign Up',
                        () {
                          final String email = emailController.text.trim();
                          final String password =
                              passwordController.text.trim();

                          if (email.isEmpty) {
                            print('Email is empty');
                          } else {
                            if (password.isEmpty) {
                              print('password is empty');
                            } else {
                              context
                                  .read<AuthService>()
                                  .signUp(email, password)
                                  .then(
                                (value) async {
                                  User user = FirebaseAuth.instance.currentUser;
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(user.uid)
                                      .set(
                                    {
                                      'uid': user.uid,
                                      'email': email,
                                      'password': password,
                                      'imageUrl': 'null',
                                      'firstname': fnameController.text,
                                      'lastname': lnameController.text
                                    },
                                  );
                                },
                              );
                            }
                          }
                          if (User == null) {
                            print('Register Erorr');
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EndIntro(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: sx(75),
                            height: sx(75),
                            child: ElevatedButton(
                              child: Icon(
                                Icons.facebook_rounded,
                                color: Colors.blue,
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                primary: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            width: sx(75),
                            height: sx(75),
                            child: ElevatedButton(
                              child: Icon(
                                MdiIcons.google,
                                color: Colors.redAccent,
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                primary: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            width: sx(75),
                            height: sx(75),
                            child: ElevatedButton(
                              child: Icon(
                                MdiIcons.twitter,
                                color: Colors.lightBlueAccent,
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                primary: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
