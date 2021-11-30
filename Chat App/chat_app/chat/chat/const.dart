import 'package:flutter/material.dart';

Color pagesColors = Color.fromRGBO(240, 240, 240, 1);

Future<void> push(BuildContext context, Widget widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

Future<void> pushReplacement(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

Widget processLoading(BuildContext context, String message) {
  return Dialog(
    backgroundColor: Colors.white,
    child: Container(
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              message,
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Please Wait...',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    ),
  );
}
