import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/Widgets/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:relative_scale/relative_scale.dart';
import 'Favorite/Favorite.dart';
import 'MyTrainer/myTrainer.dart';
import 'NotificationScreen/notification.dart';
import 'Privacypolicy.dart';
import 'editprofile.dart';
import 'unlockPremium/unlock.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File userProfile;
  User user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    getData();
  }

  String fullname;
  String fileUrl;

  final FirebaseAuth auth = FirebaseAuth.instance;

  void getData() async {
    final User user = auth.currentUser;
    // final uid = user.uid;
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection("${user.email}'s Account")
        .doc("Account")
        .get();
    setState(() {
      fullname = variable['firstname'] + ' ' + variable['lastname'];
      fileUrl = variable['imageUrl'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: GradientText(
              'Profile',
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromRGBO(65, 65, 67, 1),
                  Color.fromRGBO(239, 66, 54, 1),
                ],
              ),
              style: TextStyle(fontSize: sy(24), fontWeight: FontWeight.bold),
            ),
          ),
          body: fullname == null
              ? Center(child: Icon(Fontelico.spin6))
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: ClipOval(
                            child: fileUrl != 'null'
                                ? Image.network(fileUrl)
                                : Icon(
                                    FontAwesome.user_secret,
                                    size: 50,
                                  ),
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Linecons.pencil,
                            size: 14,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(),
                              ),
                            );
                          },
                        ),
                        title: Text(fullname),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          'About',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyTrainer(),
                            ),
                          );
                        },
                        title: Text('My Trainer'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      ListTile(
                        onTap: () {
                          getData();
                        },
                        title: Text('My workout'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          );
                        },
                        title: Text('Notifications'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Favorite(),
                            ),
                          );
                        },
                        title: Text('Favorites'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UnlockPremium(),
                            ),
                          );
                        },
                        title: Text('Unlock Premium'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      ListTile(
                        title: Text('Invite Friends'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PrivacyPolicy(),
                            ),
                          );
                        },
                        title: Text('Privacy Policy'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      ListTile(
                        title: Text('Terms of Use'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          'App',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        title: Text('Support'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      ListTile(
                        title: Text('Report a Bug'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      ListTile(
                        title: Text('App Version 1.0'),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 75, top: 30, left: 20, right: 20),
                        child: gradientButton(
                          'LogOut',
                          () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                contentPadding: EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                // contentPadding: EdgeInsets.all(0),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: <Color>[
                                            Color.fromRGBO(65, 65, 67, 1),
                                            Color.fromRGBO(239, 66, 54, .75),
                                          ],
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          FontAwesome5.exclamation,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        'Logout ?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        OutlineGradientButton(
                                          padding: EdgeInsets.zero,
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          elevation: 5,
                                          radius: Radius.circular(10),
                                          backgroundColor: Colors.white,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.5,
                                            height: sy(30),
                                            alignment: Alignment.center,
                                            child: GradientText(
                                              'Cencel',
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: <Color>[
                                                  Color.fromRGBO(65, 65, 67, 1),
                                                  Color.fromRGBO(
                                                      239, 66, 54, 1),
                                                ],
                                              ),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
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
                                        Spacer(),
                                        OutlineGradientButton(
                                          onTap: () {
                                            FirebaseAuth.instance.signOut();
                                            Navigator.pop(context);
                                          },
                                          elevation: 5,
                                          padding: EdgeInsets.zero,
                                          radius: Radius.circular(30),
                                          backgroundColor: Colors.white,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: <Color>[
                                                  Color.fromRGBO(65, 65, 67, 1),
                                                  Color.fromRGBO(
                                                      239, 66, 54, 1),
                                                ],
                                              ),
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.5,
                                            height: sy(30),
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Logout',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
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
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
