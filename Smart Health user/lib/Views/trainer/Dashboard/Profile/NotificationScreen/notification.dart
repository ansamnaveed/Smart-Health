import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:relative_scale/relative_scale.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List notifications = [
    {
      "title": "Congratulations",
      "subtitle": "Congratulations, you have completed your today's workout.",
    },
    {
      "title": "Subscribe preminum plan and save 25%.",
      "subtitle":
          "Subscribe our premium plan and save upto 25%. Subscribe Now.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color.fromRGBO(65, 65, 67, 1),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Notifications',
              style: TextStyle(
                  fontSize: sy(18),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: notifications.isEmpty
              ? Center(
                  child: Icon(
                    FontAwesome.bell_off_empty,
                    color: Colors.grey.withOpacity(.3),
                    size: 100,
                  ),
                )
              : ListView.builder(
                  itemCount: notifications == null ? 0 : notifications.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      shape: Border(
                        bottom: BorderSide(color: Colors.white),
                      ),
                      tileColor: Colors.grey.withOpacity(.3),
                      leading: Container(
                        height: sx(80),
                        width: sx(80),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color.fromRGBO(65, 65, 67, 1),
                              Color.fromRGBO(239, 66, 54, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          FontAwesome.bell,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(notifications[index]['title']),
                      subtitle: Text(notifications[index]['subtitle']),
                    );
                  },
                ),
        );
      },
    );
  }
}
