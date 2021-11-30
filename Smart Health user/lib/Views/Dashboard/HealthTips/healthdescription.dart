import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/Views/Dashboard/Profile/MyTrainer/trainerdescription.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:relative_scale/relative_scale.dart';

class HealthTipsDescription extends StatefulWidget {
  final String dateTime;
  final String description;
  final String name;
  final String thumbUrl;
  final String uploader;
  const HealthTipsDescription(
    this.dateTime,
    this.description,
    this.name,
    this.thumbUrl,
    this.uploader,
  );

  @override
  _HealthTipsDescriptionState createState() => _HealthTipsDescriptionState();
}

class _HealthTipsDescriptionState extends State<HealthTipsDescription> {
  String email;
  String fullname;
  String imageurl;
  String about;
  String description;

  bool istapped = false;
  bool isLiked = false;

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
        .collection("${user.email}'s Liked Tips")
        .doc(widget.dateTime)
        .get();
    setState(() {
      isLiked = likes.exists;
    });
  }

  User user = FirebaseAuth.instance.currentUser;

  void initState() {
    super.initState();
    getData();
    checkLiked();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return SafeArea(
          child: Scaffold(
            body: imageurl == null
                ? Center(
                    child: Icon(Fontelico.spin6),
                  )
                : Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.thumbUrl),
                              fit: BoxFit.cover),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        trailing: isLiked == true
                            ? IconButton(
                                onPressed: () async {
                                  setState(() {
                                    istapped = true;
                                  });
                                  await FirebaseFirestore.instance
                                      .collection("${user.email}'s Liked Tips")
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
                                icon: Icon(Icons.favorite_rounded,
                                    color: Colors.red),
                              )
                            : IconButton(
                                onPressed: () async {
                                  setState(() {
                                    istapped = true;
                                  });
                                  await FirebaseFirestore.instance
                                      .collection("${user.email}'s Liked Tips")
                                      .doc(widget.dateTime)
                                      .set({
                                        "uploadDate": widget.dateTime,
                                        "description": widget.description,
                                        "name": widget.name,
                                        "thumbUrl": widget.thumbUrl,
                                        "uploader": widget.uploader,
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
                                icon: Icon(Icons.favorite_border_rounded),
                              ),
                        title: Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      ListTile(
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
                      Divider(
                        height: 0,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(10),
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(widget.description)
                            ],
                          ),
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
