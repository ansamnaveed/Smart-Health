import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:relative_scale/relative_scale.dart';

class TrainerDescription extends StatefulWidget {
  final String uploader;
  TrainerDescription(this.uploader);

  @override
  _TrainerDescriptionState createState() => _TrainerDescriptionState();
}

class _TrainerDescriptionState extends State<TrainerDescription> {
  bool isFollow = false;
  bool istpped = false;

  final FirebaseAuth auth = FirebaseAuth.instance;

  String username;
  String userdp;
  String email;
  String fullname;
  String imageurl;
  String about;
  String description;
  String status;

  void getData() async {
    DocumentSnapshot account = await FirebaseFirestore.instance
        .collection("${widget.uploader}'s Account")
        .doc("Account")
        .get();
    DocumentSnapshot trainer = await FirebaseFirestore.instance
        .collection("${widget.uploader}'s Account")
        .doc("Trainer")
        .get();
    DocumentSnapshot trainee = await FirebaseFirestore.instance
        .collection("${user.email}'s Account")
        .doc("Account")
        .get();
    setState(
      () {
        username = "${trainee['firstname']} ${trainee['lastname']}";
        userdp = trainee['imageUrl'];
        email = account['email'];
        fullname = "${account['firstname']} ${account['lastname']}";
        imageurl = account['imageUrl'];
        about = trainer['about'];
        description = trainer['description'];
        status = account['status'];
      },
    );
  }

  void initState() {
    super.initState();
    getData();
    checkFollow();
  }

  User user = FirebaseAuth.instance.currentUser;

  checkFollow() async {
    DocumentSnapshot account = await FirebaseFirestore.instance
        .collection("${widget.uploader}'s Followers")
        .doc(user.email)
        .get();
    setState(() {
      isFollow = account.exists;
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference _productss =
        FirebaseFirestore.instance.collection("$email's Followers");
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
                              image: NetworkImage(imageurl), fit: BoxFit.cover),
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
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder(
                              stream: _productss.snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                                if (streamSnapshot.hasData) {
                                  return Text(
                                      "${streamSnapshot.data.docs.length}");
                                } else
                                  return Text("0");
                              },
                            ),
                            Text('Followers'),
                          ],
                        ),
                        title: Text(
                          fullname,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        subtitle: Text(about),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(10),
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(description),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: isFollow == true
                            ? OutlineGradientButton(
                                onTap: () async {
                                  setState(() {
                                    istpped = true;
                                  });
                                  await FirebaseFirestore.instance
                                      .collection("$email's Followers")
                                      .doc(user.email)
                                      .delete()
                                      .then(
                                        (value) => FirebaseFirestore.instance
                                            .collection(
                                                "${user.email}'s trainers")
                                            .doc(email)
                                            .delete()
                                            .then(
                                              (value) => setState(
                                                () {
                                                  isFollow = false;
                                                },
                                              ),
                                            ),
                                      )
                                      .then(
                                        (value) => setState(
                                          () {
                                            istpped = false;
                                          },
                                        ),
                                      );
                                },
                                elevation: 5,
                                padding: EdgeInsets.zero,
                                radius: Radius.circular(30),
                                backgroundColor: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: <Color>[
                                        Color.fromRGBO(65, 65, 67, 1),
                                        Color.fromRGBO(239, 66, 54, 1),
                                      ],
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  height: sy(30),
                                  alignment: Alignment.center,
                                  child: istpped == true
                                      ? Icon(Fontelico.spin6)
                                      : Text(
                                          'Unfollow',
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
                            : OutlineGradientButton(
                                padding: EdgeInsets.zero,
                                onTap: () async {
                                  setState(() {
                                    istpped = true;
                                  });
                                  User user = FirebaseAuth.instance.currentUser;
                                  await FirebaseFirestore.instance
                                      .collection("$email's Followers")
                                      .doc(user.email)
                                      .set(
                                        {
                                          'email': user.email,
                                          'fullname': username,
                                          'userdp': userdp,
                                        },
                                      )
                                      .then(
                                        (value) => FirebaseFirestore.instance
                                            .collection(
                                                "${user.email}'s trainers")
                                            .doc(email)
                                            .set(
                                          {
                                            'email': email,
                                            'name': fullname,
                                            'dp': imageurl,
                                            'about': about,
                                            'description': description,
                                          },
                                        ).then(
                                          (value) => setState(
                                            () {
                                              isFollow = true;
                                            },
                                          ),
                                        ),
                                      )
                                      .then(
                                        (value) => setState(
                                          () {
                                            istpped = false;
                                          },
                                        ),
                                      );
                                },
                                elevation: 5,
                                radius: Radius.circular(30),
                                backgroundColor: Colors.white,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  height: sy(30),
                                  alignment: Alignment.center,
                                  child: istpped == true
                                      ? Icon(Fontelico.spin6)
                                      : GradientText(
                                          'Follow',
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: <Color>[
                                              Color.fromRGBO(65, 65, 67, 1),
                                              Color.fromRGBO(239, 66, 54, 1),
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
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
