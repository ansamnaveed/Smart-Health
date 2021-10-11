import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:relative_scale/relative_scale.dart';

class Seven extends StatefulWidget {
  const Seven({Key key}) : super(key: key);

  @override
  _SevenState createState() => _SevenState();
}

class _SevenState extends State<Seven> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return Padding(
          padding: EdgeInsets.only(left: sx(20), right: sx(20), top: sy(70)),
          // padding: EdgeInsets.symmetric(horizontal: sx(20), vertical: sy(70)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '7 of 7',
                style: TextStyle(
                  color: Color.fromRGBO(65, 65, 67, 0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: sy(10)),
                child: GradientText(
                  'What motivates you to excercise?',
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color.fromRGBO(65, 65, 67, 1),
                      Color.fromRGBO(239, 66, 54, 1),
                    ],
                  ),
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: sy(24)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        if (isSelected2 == true ||
                            isSelected3 == true ||
                            isSelected4 == true ||
                            isSelected5 == true) {
                          isSelected2 =
                              isSelected3 = isSelected4 = isSelected5 = false;
                        }
                        if (isSelected1 == false) {
                          setState(() {
                            isSelected1 = true;
                          });
                        } else if (isSelected1 == true) {
                          setState(() {
                            isSelected1 = false;
                          });
                        }
                      },
                      tileColor: isSelected1 == false
                          ? Colors.transparent
                          : Color.fromRGBO(239, 66, 54, .75),
                      title: isSelected1 == false
                          ? GradientText(
                              'Improve Health',
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromRGBO(65, 65, 67, 1),
                                  Color.fromRGBO(239, 66, 54, .75),
                                ],
                              ),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'Improve Health',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                      trailing: Icon(
                        LineariconsFree.heart_pulse,
                        color: isSelected1 == false
                            ? Color.fromRGBO(65, 65, 67, .5)
                            : Colors.white,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        if (isSelected1 == true ||
                            isSelected3 == true ||
                            isSelected4 == true ||
                            isSelected5 == true) {
                          isSelected1 =
                              isSelected3 = isSelected4 = isSelected5 = false;
                        }
                        if (isSelected2 == false) {
                          setState(() {
                            isSelected2 = true;
                          });
                        } else if (isSelected2 == true) {
                          setState(() {
                            isSelected2 = false;
                          });
                        }
                      },
                      tileColor: isSelected2 == false
                          ? Colors.transparent
                          : Color.fromRGBO(239, 66, 54, .75),
                      title: isSelected2 == false
                          ? GradientText(
                              'Boosting Immune system',
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromRGBO(65, 65, 67, 1),
                                  Color.fromRGBO(239, 66, 54, .75),
                                ],
                              ),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'Boosting Immune system',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                      trailing: Icon(
                        Octicons.shield_check,
                        color: isSelected2 == false
                            ? Color.fromRGBO(65, 65, 67, .5)
                            : Colors.white,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        if (isSelected1 == true ||
                            isSelected2 == true ||
                            isSelected4 == true ||
                            isSelected5 == true) {
                          isSelected1 =
                              isSelected2 = isSelected4 = isSelected5 = false;
                        }
                        if (isSelected3 == false) {
                          setState(() {
                            isSelected3 = true;
                          });
                        } else if (isSelected3 == true) {
                          setState(() {
                            isSelected3 = false;
                          });
                        }
                      },
                      tileColor: isSelected3 == false
                          ? Colors.transparent
                          : Color.fromRGBO(239, 66, 54, .75),
                      title: isSelected3 == false
                          ? GradientText(
                              'Looking Better',
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromRGBO(65, 65, 67, 1),
                                  Color.fromRGBO(239, 66, 54, .75),
                                ],
                              ),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'Looking Better',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                      trailing: Icon(
                        RpgAwesome.trophy,
                        color: isSelected3 == false
                            ? Color.fromRGBO(65, 65, 67, .5)
                            : Colors.white,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        if (isSelected1 == true ||
                            isSelected2 == true ||
                            isSelected3 == true ||
                            isSelected5 == true) {
                          isSelected1 =
                              isSelected2 = isSelected3 = isSelected5 = false;
                        }
                        if (isSelected4 == false) {
                          setState(() {
                            isSelected4 = true;
                          });
                        } else if (isSelected4 == true) {
                          setState(() {
                            isSelected4 = false;
                          });
                        }
                      },
                      tileColor: isSelected4 == false
                          ? Colors.transparent
                          : Color.fromRGBO(239, 66, 54, .75),
                      title: isSelected4 == false
                          ? GradientText(
                              'Building Strength & Endurance',
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromRGBO(65, 65, 67, 1),
                                  Color.fromRGBO(239, 66, 54, .75),
                                ],
                              ),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'Building Strength & Endurance',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                      trailing: Icon(
                        RpgAwesome.muscle_up,
                        color: isSelected4 == false
                            ? Color.fromRGBO(65, 65, 67, .5)
                            : Colors.white,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        if (isSelected1 == true ||
                            isSelected2 == true ||
                            isSelected3 == true ||
                            isSelected4 == true) {
                          isSelected1 =
                              isSelected2 = isSelected3 = isSelected4 = false;
                        }
                        if (isSelected5 == false) {
                          setState(() {
                            isSelected5 = true;
                          });
                        } else if (isSelected5 == true) {
                          setState(() {
                            isSelected5 = false;
                          });
                        }
                      },
                      tileColor: isSelected5 == false
                          ? Colors.transparent
                          : Color.fromRGBO(239, 66, 54, .75),
                      title: isSelected5 == false
                          ? GradientText(
                              'Boostibg Libido',
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromRGBO(65, 65, 67, 1),
                                  Color.fromRGBO(239, 66, 54, .75),
                                ],
                              ),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'Boostibg Libido',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                      trailing: Icon(
                        Elusive.male,
                        color: isSelected5 == false
                            ? Color.fromRGBO(65, 65, 67, .5)
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
