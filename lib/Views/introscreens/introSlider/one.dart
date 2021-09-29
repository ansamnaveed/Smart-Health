import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:relative_scale/relative_scale.dart';

class One extends StatefulWidget {
  const One({Key key}) : super(key: key);

  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return 
        Padding(
          padding: EdgeInsets.only(left: sx(20), right: sx(20), top: sy(70)),
          // padding: EdgeInsets.symmetric(horizontal: sx(20), vertical: sy(70)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1 of 7',
                style: TextStyle(
                  color: Color.fromRGBO(65, 65, 67, 0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: sy(10)),
                child: GradientText(
                  'What is your goal?',
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
                  Padding(
                    padding: EdgeInsets.only(top: sy(50)),
                    child: 
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        onTap: () {
                          if (isSelected3 == true || isSelected2 == true) {
                            isSelected3 = isSelected2 = false;
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
                                'Be Healthier',
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
                                'Be Healthier',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                        subtitle: Text(
                          'Eat and train for optimum health',
                          style: TextStyle(
                            color: isSelected1 == false
                                ? Color.fromRGBO(65, 65, 67, .5)
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      onTap: () {
                        if (isSelected1 == true || isSelected3 == true) {
                          isSelected1 = isSelected3 = false;
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
                              'Lose Weight',
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
                              'Lose Weight',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                      subtitle: Text(
                        'Get leaner and increase your stamina',
                        style: TextStyle(
                          color: isSelected2 == false
                              ? Color.fromRGBO(65, 65, 67, .5)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      onTap: () {
                        if (isSelected1 == true || isSelected2 == true) {
                          isSelected1 = isSelected2 = false;
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
                              'Gain Weight',
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
                              'Gain Weight',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                      subtitle: Text(
                        'Build muscle strngth and flexibility',
                        style: TextStyle(
                          color: isSelected3 == false
                              ? Color.fromRGBO(65, 65, 67, .5)
                              : Colors.white,
                        ),
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
