import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/Views/Dashboard/Profile/MyTrainer/trainerdescription.dart';
import 'package:fireauth/Views/Dashboard/SearchScreens/workout.dart';
import 'package:fireauth/Views/player.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:relative_scale/relative_scale.dart';

class Training extends StatefulWidget {
  const Training({Key key}) : super(key: key);

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients)
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
        );
    });
  }

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
              'Training',
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
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    height: sy(170),
                    width: double.infinity,
                    child: StreamBuilder(
                      stream: _productss.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return PageView.builder(
                            controller: _pageController,
                            itemCount: streamSnapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data.docs[index];
                              return Container(
                                margin: EdgeInsets.only(right: 2.5, left: 2.5),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          documentSnapshot['thumb']),
                                      // colorFilter: ColorFilter.mode(
                                      //     Colors.white.withOpacity(0.2),
                                      //     BlendMode.dstATop),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                // height: 150,
                                width: double.infinity,
                                child: Container(
                                    alignment: Alignment.bottomCenter,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(50),
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Colors.transparent,
                                          Color.fromRGBO(239, 66, 54, .5),
                                        ],
                                      ),
                                    ),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            documentSnapshot['name'],
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    239, 66, 54, .5),
                                                fontSize: 16,
                                                shadows: <BoxShadow>[
                                                  BoxShadow(
                                                    color: Colors.black38,
                                                    blurRadius: 1.0,
                                                    spreadRadius: 0,
                                                    offset: Offset(1, 1),
                                                  )
                                                ],
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          documentSnapshot['description'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.zero,
                                          subtitle: Row(
                                            children: [
                                              Icon(RpgAwesome.stopwatch,
                                                  color: Colors.white),
                                              Text(
                                                " ${documentSnapshot['duration']} min",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          trailing: InkWell(
                                            child: Icon(
                                                Icons
                                                    .play_circle_filled_rounded,
                                                size: 55,
                                                color: Colors.white),
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) => Player(
                                                    documentSnapshot['video'],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            },
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Container(
                        // padding: EdgeInsets.symmetric(vertical: sy(10)),
                        margin: EdgeInsets.symmetric(vertical: sy(10)),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: ListTile(
                          leading: SizedBox(
                            width: sx(175),
                          ),
                          title: Text(
                            "You're doing great!",
                            style: TextStyle(
                                color: Color.fromRGBO(239, 65, 54, 1)),
                          ),
                          subtitle: Text('Keep it up\nand stick to your plan!'),
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/images/run1.png'),
                        height: sy(68),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Flat Abs Workout Plan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: StreamBuilder(
                    stream: _productss.snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: streamSnapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data.docs[index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Player(
                                      documentSnapshot['video'],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 2.0,
                                      spreadRadius: -1,
                                      offset: Offset(1, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      documentSnapshot['thumb'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.bottomLeft,
                                  width: 100,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        Colors.transparent,
                                        Color.fromRGBO(239, 66, 54, .5),
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    documentSnapshot['name'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Populer Workout',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: 150,
                    child: StreamBuilder(
                      stream: _workOuts.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return ListView.builder(
                            reverse: streamSnapshot.data.docs.length > 4
                                ? true
                                : false,
                            scrollDirection: Axis.horizontal,
                            itemCount: streamSnapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data.docs[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => WorkOutScreen(
                                        documentSnapshot['Date&Time'],
                                        documentSnapshot['description'],
                                        documentSnapshot['duration'],
                                        documentSnapshot['name'],
                                        documentSnapshot['thumbUrl'],
                                        documentSnapshot['workOutUrl'],
                                        documentSnapshot['uploader'],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 2.0,
                                        spreadRadius: -1,
                                        offset: Offset(1, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          documentSnapshot["thumbUrl"]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    width: 100,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Colors.transparent,
                                          Color.fromRGBO(239, 66, 54, .5),
                                        ],
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.all(10),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            documentSnapshot["name"],
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 10),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.timelapse_rounded,
                                                color: Colors.grey,
                                                size: 10,
                                              ),
                                              Text(
                                                "${documentSnapshot['duration']} min",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10),
                                              ),
                                            ],
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

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Populer Trainers',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    width: double.infinity,
                    height: 150,
                    child: StreamBuilder(
                      stream: _trainers.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return ListView.builder(
                            reverse: streamSnapshot.data.docs.length > 4
                                ? true
                                : false,
                            scrollDirection: Axis.horizontal,
                            itemCount: streamSnapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data.docs[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => TrainerDescription(
                                        documentSnapshot['email'],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 2.0,
                                        spreadRadius: -1,
                                        offset: Offset(1, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(documentSnapshot["dp"]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    width: 100,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Colors.transparent,
                                          Color.fromRGBO(239, 66, 54, .5),
                                        ],
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.all(10),
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            documentSnapshot["fullname"],
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 10),
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

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
                SizedBox(
                  height: sy(75),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  CollectionReference _productss =
      FirebaseFirestore.instance.collection("slider");
  CollectionReference _workOuts =
      FirebaseFirestore.instance.collection("All Workouts");
  CollectionReference _trainers =
      FirebaseFirestore.instance.collection("All Trainers");
}
