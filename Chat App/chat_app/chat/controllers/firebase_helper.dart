import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/views/const.dart';
import 'package:chat_app/views/contact_list.dart';
import 'package:chat_app/views/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  final auth = FirebaseAuth.instance;
  FirebaseFirestore storeMessages = FirebaseFirestore.instance;

  void create_user(BuildContext context, String username, String email,
      String password) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return processLoading(context, "Creating Your Profile");
      },
    );
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User user = FirebaseAuth.instance.currentUser;
      UserModel userModel = UserModel();
      userModel.uid = user.uid;
      userModel.email = email;
      userModel.username = username;
      await firebaseFirestore
          .collection('User')
          .doc(user.uid)
          .set(userModel.toMap());
      ScaffoldMessenger.of(context)
          .showSnackBar(message(context, 'Wellcome to Chat App'));
      Navigator.of(context).pop();
      pushReplacement(context, ContactList());
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(message(context, e));
      Navigator.of(context).pop();
    });
  }

  void login_user(BuildContext context, String email, String password) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return processLoading(context, "Preforming Login");
      },
    );
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(message(context, 'Wellcome Back'));
      Navigator.of(context).pop();
      pushReplacement(context, ContactList());
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(message(context, e));
      Navigator.of(context).pop();
    });
  }

  void sign_out(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) {
      pushReplacement(context, SignIn());
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(message(context, e));
    });
  }

  SnackBar message(context, message) {
    return SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }

  void send_message(BuildContext context, String message) async {
    User user = FirebaseAuth.instance.currentUser;
    await storeMessages.collection('Messages').doc().set({
      "message": message,
      "uid": user.uid,
      "date_time": '${DateTime.now()}'
    });
  }
}
