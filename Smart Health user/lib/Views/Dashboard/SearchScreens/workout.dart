import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/Views/Dashboard/Profile/MyTrainer/trainerdescription.dart';
import 'package:fireauth/Views/player.dart';
import 'package:fireauth/Widgets/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:relative_scale/relative_scale.dart';

class WorkOutScreen extends StatefulWidget {
  final String dateTime;
  final String description;
  final String duration;
  final String name;
  final String thumbUrl;
  final String workOutUrl;
  final String uploader;
  const WorkOutScreen(
    this.dateTime,
    this.description,
    this.duration,
    this.name,
    this.thumbUrl,
    this.workOutUrl,
    this.uploader,
  );

  @override
  _WorkOutScreenState createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String email;
  String fullname;
  String imageurl;
  String about;
  String description;

  bool isLiked = false;
  bool istapped = false;

  void getData() async {
    DocumentSnapshot account = await FirebaseFirestore.instance
        .collection("${widget.uploader}'s Account")
        .doc("Account")
        .get();
    DocumentSnapshot trainer = await FirebaseFirestore.instance
        .collection("${widget.uploader}'s Account")
        .doc("Trainer")
        .get();
    setState(
      () {
        email = account['email'];
        fullname = "${account['firstname']} ${account['lastname']}";
        imageurl = account['imageUrl'];
        about = trainer['about'];
        description = trainer['description'];
      },
    );
  }

  checkLiked() async {
    DocumentSnapshot likes = await FirebaseFirestore.instance
        .collection("${user.email}'s Liked Workouts")
        .doc(widget.dateTime)
        .get();
    setState(() {
      isLiked = likes.exists;
    });
  }

  void initState() {
    super.initState();
    getData();
    checkLiked();
  }

  User user = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color.fromRGBO(65, 65, 67, 1),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              widget.name,
              style: TextStyle(
                  fontSize: sy(18),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: isLiked == true
                    ? IconButton(
                        onPressed: () async {
                          setState(() {
                            istapped = true;
                          });
                          await FirebaseFirestore.instance
                              .collection("${user.email}'s Liked Workouts")
                              .doc(widget.dateTime)
                              .delete()
                              .then(
                                (value) => setState(
                                  () {
                                    isLiked = false;
                                  },
                                ),
                              )
                              .then(
                                (value) => setState(
                                  () {
                                    istapped = false;
                                  },
                                ),
                              );
                        },
                        icon: Icon(Icons.favorite_rounded, color: Colors.red),
                      )
                    : IconButton(
                        onPressed: () async {
                          setState(() {
                            istapped = true;
                          });
                          await FirebaseFirestore.instance
                              .collection("${user.email}'s Liked Workouts")
                              .doc(widget.dateTime)
                              .set({
                                "Date&Time": widget.dateTime,
                                "description": widget.description,
                                "duration": widget.duration,
                                "name": widget.name,
                                "thumbUrl": widget.thumbUrl,
                                "uploader": widget.uploader,
                                "workOutUrl": widget.workOutUrl,
                              })
                              .then(
                                (value) => setState(
                                  () {
                                    isLiked = true;
                                  },
                                ),
                              )
                              .then(
                                (value) => setState(
                                  () {
                                    istapped = false;
                                  },
                                ),
                              );
                        },
                        icon: Icon(Icons.favorite_border_rounded,
                            color: Colors.grey),
                      ),
              ),
            ],
          ),
          body: imageurl == null
              ? Center(
                  child: Icon(Fontelico.spin6),
                )
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
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
                              image: NetworkImage(widget.thumbUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.bottomLeft,
                            width: double.infinity,
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
                          ),
                        ),
                      ),
                      Container(
                        color: Color.fromRGBO(239, 65, 54, .75),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    TrainerDescription(widget.uploader),
                              ),
                            );
                          },
                          title: Text(fullname),
                          subtitle: Text(about),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imageurl),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Duration:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${widget.duration} min",
                                ),
                              ],
                            ),
                            Text(widget.description),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: Colors.transparent,
            elevation: 0,
            label: Container(
              width: 150,
              child: gradientButton("Start Workout", () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Player(widget.workOutUrl),
                  ),
                );
              }),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
