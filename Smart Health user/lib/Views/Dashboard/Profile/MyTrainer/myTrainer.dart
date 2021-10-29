import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/Views/Dashboard/Profile/MyTrainer/trainerdescription.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class MyTrainer extends StatefulWidget {
  const MyTrainer({Key key}) : super(key: key);

  @override
  _MyTrainerState createState() => _MyTrainerState();
}

class _MyTrainerState extends State<MyTrainer> {
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    CollectionReference _productss =
        FirebaseFirestore.instance.collection("${user.email}'s trainers");
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
              'My Trainer',
              style: TextStyle(
                  fontSize: sy(18),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: StreamBuilder(
            stream: _productss.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: streamSnapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data.docs[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: sy(5)),
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TrainerDescription(
                                    documentSnapshot['email']),
                              ));
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        leading: Container(
                          width: sx(120),
                          height: sx(120),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                  documentSnapshot['dp'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        title: Text(documentSnapshot['name']),
                        subtitle: Text(documentSnapshot['about']),
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
        );
      },
    );
  }
}
