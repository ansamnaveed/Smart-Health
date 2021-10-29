import 'package:fireauth/Models/auth_services.dart';
import 'package:fireauth/Views/Dashboard/dashboard.dart';
import 'package:fireauth/Views/introscreens/intro.dart';
import 'package:fireauth/Widgets/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  "It's good to see you again",
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
              child: Padding(
                padding: EdgeInsets.all(sy(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: sx(20)),
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
                        'Sign In',
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
                                  .login(email, password)
                                  .then(
                                (User user) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EndIntro(),
                                    ),
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: OutlineGradientButton(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => IntroScreen(),
                            ),
                          );
                        },
                        elevation: 5,
                        radius: Radius.circular(30),
                        backgroundColor: Colors.white,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          alignment: Alignment.center,
                          child: GradientText(
                            'Sign Up',
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color.fromRGBO(65, 65, 67, 1),
                                Color.fromRGBO(239, 66, 54, 1),
                              ],
                            ),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color.fromRGBO(65, 65, 67, 1),
                            Color.fromRGBO(239, 66, 54, 1),
                          ],
                        ),
                        strokeWidth: 2,
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
