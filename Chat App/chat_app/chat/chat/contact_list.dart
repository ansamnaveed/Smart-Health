import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    currentUser = '';
    getCurrentUser();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async {
    await _firestore.collection('User').doc(_auth.currentUser.uid).update({
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
    if (sender[0].toLowerCase().codeUnits[0] >
        reciver.toLowerCase().codeUnits[0]) {
      return "$sender$reciver";
    } else {
      return "$reciver$sender";
    }
  }

  FirebaseServices firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pagesColors,
      appBar: AppBar(
        title: Text('Contact List'),
        brightness: Brightness.dark,
        actions: [
          IconButton(
            onPressed: () {
              firebaseServices.sign_out(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('User')
            .where("uid", isNotEqualTo: _auth.currentUser.uid)
            .snapshots(),
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
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      roomId = chatRoomId(
                        queryDocumentSnapshot['username'],
                        currentUser,
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
                          'https://i.pinimg.com/736x/a5/bc/87/a5bc87525c7f612248b60ab4df61eee3.jpg',
                        ),
                        radius: 50,
                      ),
                    ),
                    title: Text(queryDocumentSnapshot['username']),
                    subtitle: Text(queryDocumentSnapshot['email']),
                    trailing: queryDocumentSnapshot['status'] == 'Online'
                        ? Icon(
                            FontAwesome5.circle,
                            size: 20,
                            color: Colors.green,
                          )
                        : Icon(
                            FontAwesome5.circle,
                            size: 20,
                            color: Colors.red,
                          ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void getCurrentUser() async {
    User user = await FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('User')
        .doc(user.uid)
        .get()
        .then((loggedInUser) {
      setState(() {
        currentUser = loggedInUser.data()['username'];
      });
    }).catchError((e) {
      print(e);
    });
  }
}
