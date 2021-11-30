import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/Views/Dashboard/HealthTips/healthdescription.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoriteHealthTips extends StatefulWidget {
  const FavoriteHealthTips({Key key}) : super(key: key);

  @override
  _FavoriteHealthTipsState createState() => _FavoriteHealthTipsState();
}

class _FavoriteHealthTipsState extends State<FavoriteHealthTips> {
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    CollectionReference _productss =
        FirebaseFirestore.instance.collection("${user.email}'s Liked Tips");
    return Scaffold(
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
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HealthTipsDescription(
                          documentSnapshot['Date&Time'],
                          documentSnapshot['description'],
                          documentSnapshot['name'],
                          documentSnapshot['thumbUrl'],
                          documentSnapshot['uploader'],
                        ),
                      ),
                    );
                  },
                  child: Padding(
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
                          child: Text(
                            documentSnapshot['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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
    );
  }
}
