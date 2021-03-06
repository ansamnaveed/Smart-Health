import 'package:fireauth/Views/trainer/Dashboard/HealthTips/all_tips.dart';
import 'package:fireauth/Widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:relative_scale/relative_scale.dart';
import 'Chat/chatMain.dart';
import 'Profile/userprofile.dart';
import 'Training/training.dart';

class TrainerDashboard extends StatefulWidget {
  const TrainerDashboard({Key key}) : super(key: key);

  @override
  _TrainerDashboardState createState() => _TrainerDashboardState();
}

class _TrainerDashboardState extends State<TrainerDashboard> {
  @override
  void initState() {
    super.initState();
    bottomIndex = 0;
  }

  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return Scaffold(
          extendBody: true,
          body: bottomIndex == 0
              ? Training()
              : bottomIndex == 1
                  ? AllTips()
                  : bottomIndex == 2
                      ? TrainerContactList()
                      : bottomIndex == 3
                          ? UserProfile()
                          : Container,
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomAppBar(
              elevation: 5,
              // shape: CircularRectangle(),
              notchMargin: 12,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: sy(60),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          bottomIndex = 0;
                        });
                      },
                      icon: Icon(
                        RpgAwesome.muscle_up,
                        color: bottomIndex == 0
                            ? Color.fromRGBO(239, 65, 54, .75)
                            : Color.fromRGBO(65, 65, 67, .75),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          bottomIndex = 1;
                        });
                      },
                      icon: Icon(
                        LineariconsFree.heart_pulse,
                        color: bottomIndex == 1
                            ? Color.fromRGBO(239, 65, 54, .75)
                            : Color.fromRGBO(65, 65, 67, .75),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          bottomIndex = 2;
                        });
                      },
                      icon: Icon(
                        Linecons.comment,
                        color: bottomIndex == 2
                            ? Color.fromRGBO(239, 65, 54, .75)
                            : Color.fromRGBO(65, 65, 67, .75),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          bottomIndex = 3;
                        });
                      },
                      icon: Icon(
                        Linecons.user,
                        color: bottomIndex == 3
                            ? Color.fromRGBO(239, 65, 54, .75)
                            : Color.fromRGBO(65, 65, 67, .75),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
