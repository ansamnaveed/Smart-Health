import 'dart:async';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser user = ChatUser(
    name: "Fayeed",
    uid: "123456789",
    avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  );

  final ChatUser otherUser = ChatUser(
    name: "Mrfatty",
    uid: "25649654",
  );

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;

  @override
  void initState() {
    super.initState();
  }

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState.scrollController
          ..animateTo(
            _chatViewKey.currentState.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  void onSend(ChatMessage message) {
    // print(message.toJson());
    // FirebaseFirestore.instance
    //     .collection('messages')
    //     .doc(DateTime.now().millisecondsSinceEpoch.toString())
    //     .set(message.toJson());
    /* setState(() {
      messages = [...messages, message];
      print(messages.length);
    });

    if (i == 0) {
      systemMessage();
      Timer(Duration(milliseconds: 600), () {
        systemMessage();
      });
    } else {
      systemMessage();
    } */
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color.fromRGBO(65, 65, 67, 1),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Person Name',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance
      //       .collection('messages')
      //       .orderBy("createdAt")
      //       .snapshots(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: CircularProgressIndicator(
      //           valueColor: AlwaysStoppedAnimation<Color>(
      //             Theme.of(context).primaryColor,
      //           ),
      //         ),
      //       );
      //     } else {
      //       List<DocumentSnapshot> items = snapshot.data.docs;
      //       var messages =
      //           items.map((i) => ChatMessage.fromJson(i.data())).toList();
      //       return
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DashChat(
            key: _chatViewKey,
            inverted: false,
            onSend: onSend,
            sendOnEnter: true,
            textInputAction: TextInputAction.send,
            user: user,
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Color.fromRGBO(65, 65, 67, 1),
                ),
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(30),
              //   borderSide: BorderSide(
              //     color: Color.fromRGBO(65, 65, 67, 1),
              //   ),
              // ),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              hintText: "Message",
              hintStyle: TextStyle(
                color: Color.fromRGBO(118, 129, 150, 1),
              ),
            ),
            dateFormat: DateFormat('yyyy-MMM-dd'),
            timeFormat: DateFormat('HH:mm'),
            messages: messages,
            showUserAvatar: false,
            showAvatarForEveryMessage: false,
            scrollToBottom: false,
            onPressAvatar: (ChatUser user) {
              print("OnPressAvatar: ${user.name}");
            },
            onLongPressAvatar: (ChatUser user) {
              print("OnLongPressAvatar: ${user.name}");
            },
            inputMaxLines: 5,
            messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
            alwaysShowSend: true,
            inputTextStyle: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),

            onQuickReply: (Reply reply) {
              setState(() {
                messages.add(ChatMessage(
                    text: reply.value, createdAt: DateTime.now(), user: user));
                messages = [...messages];
              });

              Timer(Duration(milliseconds: 300), () {
                _chatViewKey.currentState.scrollController
                  ..animateTo(
                    _chatViewKey
                        .currentState.scrollController.position.maxScrollExtent,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  );

                if (i == 0) {
                  systemMessage();
                  Timer(Duration(milliseconds: 600), () {
                    systemMessage();
                  });
                } else {
                  systemMessage();
                }
              });
            },
            onLoadEarlier: () {
              print("laoding...");
            },
            // leading: [
            //   IconButton(
            //     icon: Icon(
            //       Icons.settings_outlined,
            //       color: Colors.white,
            //     ),
            //     onPressed: () async {
            //       showModalBottomSheet(
            //         context: context,
            //         isScrollControlled: true,
            //         builder: (context) => SingleChildScrollView(
            //           child: Container(
            //             color: Colors.black,
            //             padding: EdgeInsets.only(
            //                 bottom: MediaQuery.of(context).viewInsets.bottom),
            //             child: EventChat(),
            //           ),
            //         ),
            //       );
            //     },
            //   )
            // ],
            shouldShowLoadEarlier: false,
            showTraillingBeforeSend: true,
            trailing: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.emoji_emotions,
                  color: Color.fromRGBO(65, 65, 67, 1),
                ),
                onPressed: () async {
                  // final picker = ImagePicker();
                  // PickedFile result = await picker.getImage(
                  //   source: ImageSource.gallery,
                  //   imageQuality: 80,
                  //   maxHeight: 400,
                  //   maxWidth: 400,
                  // );

                  // if (result != null) {
                  // final Reference storageRef =
                  //     FirebaseStorage.instance.ref().child("chat_images");

                  // final taskSnapshot = await storageRef.putFile(
                  //   File(result.path),
                  //   SettableMetadata(
                  //     contentType: 'image/jpg',
                  //   ),
                  // );

                  // String url = await taskSnapshot.ref.getDownloadURL();

                  // ChatMessage message =
                  //     ChatMessage(text: "", user: user, image: url);

                  // FirebaseFirestore.instance
                  //     .collection('messages')
                  //     .add(message.toJson());
                  // }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
