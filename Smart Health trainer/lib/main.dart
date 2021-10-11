import 'package:fireauth/Models/auth_services.dart';
import 'package:fireauth/Views/Dashboard/dashboard.dart';
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
  // This widget is the root of your application.
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
      return EndIntro();
    }
    return GetStarted();
  }
}
