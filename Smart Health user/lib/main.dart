import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/Models/auth_services.dart';
import 'package:fireauth/Views/Dashboard/dashboard.dart';
import 'package:fireauth/Views/trainer/Dashboard/trainer_dashboard.dart';
import 'package:fireauth/getstarted.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Widgets/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'Smart Health',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: themePrimaryColor,
          primaryColor: Color.fromRGBO(239, 66, 54, 1),
          primaryColorDark: Color.fromRGBO(65, 65, 67, 1),
        ),
        home: Wrapper(),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();

    if (user != null) {
      return Selection();
    }
    return GetStarted();
  }
}

class Selection extends StatefulWidget {
  const Selection({Key key}) : super(key: key);

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  String role;

  final FirebaseAuth auth = FirebaseAuth.instance;

  void getData() async {
    final User user = auth.currentUser;
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection("${user.email}'s Account")
        .doc("Account")
        .get();
    setState(() {
      role = variable['role'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return role == 'trainer' ? TrainerDashboard() : EndIntro();
  }
}
