import 'package:flutter/material.dart';
import 'package:smart_health/getstarted.dart';
import 'widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Health',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themePrimaryColor,
        primaryColor: Color.fromRGBO(239, 66, 54, 1),
        primaryColorDark: Color.fromRGBO(65, 65, 67, 1),
      ),
      // home: StartIntro(),
      home: GetStarted(),
    );
  }
}
