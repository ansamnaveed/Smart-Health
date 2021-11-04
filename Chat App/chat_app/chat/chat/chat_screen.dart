import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  final QueryDocumentSnapshot userMap;
  final String chatRoomId;
  ChatScreen({@required this.chatRoomId, @required this.userMap});

  @override
  _ChatScreenState createState() =>
      _ChatScreenState(chatRoomId: chatRoomId, userMap: userMap);
}

class _ChatScreenState extends State<ChatScreen> {
  final QueryDocumentSnapshot userMap;
  final String chatRoomId;
  _ChatScreenState({@required this.chatRoomId, @required this.userMap});
  final TextEditingController _message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  File imageFile;

  Future getImage() async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        uploadImage();
      }
    });
  }

  Future uploadImage() async {
    String fileName = Uuid().v1();
    int status = 1;

    await _firestore
        .collection('Chatroom')
        .doc(chatRoomId)
        .collection('chats')
        .doc(fileName)
        .set({
      "sendby": _auth.currentUser.uid,
      "message": "",
      "type": "img",
      "time": FieldValue.serverTimestamp(),
    });

    var ref =
        FirebaseStorage.instance.ref().child('images').child("$fileName.jpg");

    var uploadTask = await ref.putFile(imageFile).catchError((error) async {
      await _firestore
          .collection('Chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .doc(fileName)
          .delete();

      status = 0;
    });

    if (status == 1) {
      String imageUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
          .collection('Chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .doc(fileName)
          .update({"message": imageUrl});
    }
  }

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": _auth.currentUser.uid,
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      _message.clear();
      await _firestore
          .collection('Chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .add(messages);
    } else {
      print("Enter Some Text");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<DocumentSnapshot>(
          stream: _firestore.collection("User").doc(userMap['uid']).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userMap['username']),
                    Text(
                      snapshot.data['status'],
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        brightness: Brightness.dark,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 35,
              height: 35,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/a5/bc/87/a5bc87525c7f612248b60ab4df61eee3.jpg',
                ),
                radius: 50,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                reverse: true,
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        DateFormat.jm().format(DateTime.now()).toString(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: GetMessages(chatRoomId: chatRoomId),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: _message,
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: IconButton(
                            onPressed: () => getImage(),
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Type your message',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onSendMessage,
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShowImage extends StatelessWidget {
  final String imageUrl;

  const ShowImage({@required this.imageUrl, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
        child: Image.network(imageUrl),
      ),
    );
  }
}

class GetMessages extends StatefulWidget {
  final String chatRoomId;
  GetMessages({@required this.chatRoomId, Key key}) : super(key: key);

  @override
  _GetMessagesState createState() => _GetMessagesState(chatRoomId: chatRoomId);
}

class _GetMessagesState extends State<GetMessages> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User user = FirebaseAuth.instance.currentUser;
  final String chatRoomId;
  _GetMessagesState({@required this.chatRoomId});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('Chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .orderBy("time", descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            primary: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              QueryDocumentSnapshot queryDocumentSnapshot =
                  snapshot.data.docs[index];
              return queryDocumentSnapshot['sendby'] != user.uid
                  ? getReceiverView(
                      ChatBubbleClipper3(type: BubbleType.receiverBubble),
                      context,
                      queryDocumentSnapshot['message'],
                      queryDocumentSnapshot['type'])
                  : getSenderView(
                      ChatBubbleClipper3(type: BubbleType.sendBubble),
                      context,
                      queryDocumentSnapshot['message'],
                      queryDocumentSnapshot['type']);
            },
          ),
        );
      },
    );
  }

  getSenderView(CustomClipper clipper, BuildContext context, String message,
          String type) =>
      ChatBubble(
        clipper: clipper,
        elevation: 0.5,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: Colors.blue[100].withOpacity(0.5),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: type == 'text'
              ? Text(
                  message,
                  style: TextStyle(color: Colors.grey[800]),
                )
              : message != ''
                  ? Container(
                    height: 250,
                    child: Image.network(
                        message,
                        fit: BoxFit.cover,
                      ),
                  )
                  : CircularProgressIndicator(),
        ),
      );

  getReceiverView(CustomClipper clipper, BuildContext context, String message,
          String type) =>
      ChatBubble(
        clipper: clipper,
        elevation: 0.5,
        backGroundColor: Colors.blue,
        margin: EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: type == 'text'
              ? Text(
                  message,
                  style: TextStyle(color: Colors.grey[800]),
                )
              : message != ''
                  ? Container(
                    height: 150,
                      child: Image.network(
                        message,
                        fit: BoxFit.cover,
                      ),
                    )
                  : CircularProgressIndicator(),
        ),
      );
}
