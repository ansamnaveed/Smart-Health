import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/chat/chat/chat_screen.dart';
import 'package:fireauth/chat/controllers/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'const.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> with WidgetsBindingObserver {
  String currentUser;
  bool isLoading = false;
  String roomId = '';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    currentUser = '';
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async {
    await _firestore
        .collection("${user.email}'s Account")
        .doc("Account")
        .update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String sender, String reciver) {
    return "$sender$reciver";
  }

  String tStatus = '';

  trainerStatus(String trainerEmail) async {
    DocumentSnapshot account = await FirebaseFirestore.instance
        .collection("$trainerEmail's Account")
        .doc('Account')
        .get();
    setState(() {
      tStatus = account['status'];
    });
    return tStatus;
  }

  User user = FirebaseAuth.instance.currentUser;

  FirebaseServices firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    CollectionReference _productss =
        FirebaseFirestore.instance.collection("${user.email}'s trainers");
    return Scaffold(
      backgroundColor: pagesColors,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: GradientText(
          'Chats',
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color.fromRGBO(65, 65, 67, 1),
              Color.fromRGBO(239, 66, 54, 1),
            ],
          ),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: _productss.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            primary: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              QueryDocumentSnapshot queryDocumentSnapshot =
                  snapshot.data.docs[index];
              return Column(
                children: [
                  ListTile(
                    tileColor: Colors.white,
                    onTap: () {
                      roomId = chatRoomId(
                        queryDocumentSnapshot['email'],
                        user.email,
                      );
                      push(
                        context,
                        ChatScreen(
                          chatRoomId: roomId,
                          userMap: queryDocumentSnapshot,
                        ),
                      );
                    },
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          queryDocumentSnapshot['dp'],
                        ),
                        radius: 50,
                      ),
                    ),
                    title: Text(queryDocumentSnapshot['name']),
                    subtitle: Text(queryDocumentSnapshot['about']),
                    trailing: trainerStatus(queryDocumentSnapshot['email']) ==
                            'Online'
                        ? Icon(
                            FontAwesome5.circle,
                            size: 5,
                            color: Colors.green,
                          )
                        : Icon(
                            FontAwesome5.circle,
                            size: 5,
                            color: Colors.red,
                          ),
                  ),
                  Divider(height: 0, thickness: 0.5),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
