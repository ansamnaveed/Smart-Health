import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/Views/Dashboard/HealthTips/healthdescription.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:relative_scale/relative_scale.dart';

class HealthTips extends StatefulWidget {
  const HealthTips({Key key}) : super(key: key);

  @override
  _HealthTipsState createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  void initState() {
    super.initState();
  }

  CollectionReference _productss =
      FirebaseFirestore.instance.collection("All Tips");

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
              'Health Tips',
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
          body: Center(
            child: body(),
          ),
        );
      },
    );
  }

  Widget body() {
    return StreamBuilder(
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
                        child: Text(documentSnapshot['name'],
                            style: TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }
}
