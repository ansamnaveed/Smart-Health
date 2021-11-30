import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/Views/player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:relative_scale/relative_scale.dart';

import 'newWorkout.dart';

class Training extends StatefulWidget {
  const Training({Key key}) : super(key: key);

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  void initState() {
    super.initState();
  }

  deleteWorkOut(String docName) async {
    User user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("${user.email}'s Workouts")
        .doc(docName)
        .delete()
        .then(
      (value) async {
        await FirebaseFirestore.instance
            .collection("All Workouts")
            .doc(docName)
            .delete();
      },
    );
  }

  CollectionReference _productss = FirebaseFirestore.instance
      .collection("${FirebaseAuth.instance.currentUser.email}'s Workouts");

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
              'WorkOuts',
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
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewWorkout(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: StreamBuilder(
            stream: _productss.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  reverse: streamSnapshot.data.docs.length > 3 ? true : false,
                  itemCount: streamSnapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 2.0,
                                  spreadRadius: -1,
                                  offset: Offset(1, 1),
                                )
                              ],
                              image: DecorationImage(
                                  image: NetworkImage(
                                    documentSnapshot['thumbUrl'],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Player(
                                        documentSnapshot['workOutUrl'],
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(Octicons.play,
                                    color: Colors.white70, size: 55),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 2.0,
                                  spreadRadius: -1,
                                  offset: Offset(1, 1),
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  minVerticalPadding: 0,
                                  dense: true,
                                  title: Text(
                                    documentSnapshot['name'],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Icon(
                                        Entypo.clock,
                                        size: 15,
                                      ),
                                      Text(
                                        ' ${documentSnapshot['duration']} min',
                                      )
                                    ],
                                  ),
                                  trailing: InkWell(
                                    onTap: () {
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
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
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: <Color>[
                                                      Color.fromRGBO(
                                                          65, 65, 67, 1),
                                                      Color.fromRGBO(
                                                          239, 66, 54, .75),
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
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                child: Text(
                                                  'Delete ?',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.5,
                                                      height: 30,
                                                      alignment:
                                                          Alignment.center,
                                                      child: GradientText(
                                                        'Cencel',
                                                        gradient:
                                                            LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                          colors: <Color>[
                                                            Color.fromRGBO(
                                                                65, 65, 67, 1),
                                                            Color.fromRGBO(
                                                                239, 66, 54, 1),
                                                          ],
                                                        ),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: <Color>[
                                                        Color.fromRGBO(
                                                            65, 65, 67, 1),
                                                        Color.fromRGBO(
                                                            239, 66, 54, 1),
                                                      ],
                                                    ),
                                                    strokeWidth: 2,
                                                  ),
                                                  Spacer(),
                                                  OutlineGradientButton(
                                                    onTap: () {
                                                      deleteWorkOut(
                                                          documentSnapshot[
                                                              "Date&Time"]);
                                                      Navigator.pop(context);
                                                    },
                                                    elevation: 5,
                                                    padding: EdgeInsets.zero,
                                                    radius: Radius.circular(30),
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        gradient:
                                                            LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                          colors: <Color>[
                                                            Color.fromRGBO(
                                                                65, 65, 67, 1),
                                                            Color.fromRGBO(
                                                                239, 66, 54, 1),
                                                          ],
                                                        ),
                                                      ),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.5,
                                                      height: 30,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: <Color>[
                                                        Color.fromRGBO(
                                                            65, 65, 67, 1),
                                                        Color.fromRGBO(
                                                            239, 66, 54, 1),
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
                                    child: Icon(Linecons.trash),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    'No WorkOuts found.',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
