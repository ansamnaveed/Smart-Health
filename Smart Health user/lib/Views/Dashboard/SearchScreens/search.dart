import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/Views/player.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:relative_scale/relative_scale.dart';

import 'workout.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  CollectionReference _productss =
      FirebaseFirestore.instance.collection("All Workouts");
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        // contentPadding: EdgeInsets.only(
                        //   top: sx(25),
                        // ),
                        hintText: "Search for workout or trainer",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(118, 129, 150, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Recent Searches'),
                ),
                Container(
                  width: double.infinity,
                  height: sy(100),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 10,
                    itemExtent: 30,
                    // itemCount: popular == null ? 0 : popular.length,
                    itemBuilder: (_, i) {
                      return ListTile(
                        leading: Icon(MdiIcons.history),
                        minLeadingWidth: 0,
                        title: Text(
                          'data',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(65, 65, 67, 1),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Populer Workout',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    height: 150,
                    child: 
                    StreamBuilder(
                      stream: _productss.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
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
                                      builder: (context) => WorkOutScreen(
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
                  child: Row(
                    children: [
                      Text(
                        'Populer Trainer',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    // itemCount: popular == null ? 0 : popular.length,
                    itemBuilder: (_, i) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                                'https://daman.co.id/daman.co.id/wp-content/uploads/2020/03/Weight-Loss-Exercises-for-Men-At-Home.jpg'),
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '7 Minutes Workout',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 10),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timelapse_rounded,
                                      color: Colors.grey,
                                      size: 10,
                                    ),
                                    Text(
                                      '20 min',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
