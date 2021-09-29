import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:relative_scale/relative_scale.dart';

class Two extends StatefulWidget {
  const Two({Key key}) : super(key: key);

  @override
  _TwoState createState() => _TwoState();
}

class _TwoState extends State<Two> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return Padding(
          padding: EdgeInsets.only(left: sx(20), right: sx(20), top: sy(70)),
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2 of 7',
                style: TextStyle(
                  color: Color.fromRGBO(65, 65, 67, 0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: sy(10)),
                child: GradientText(
                  'Male or Female?',
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
              Text(
                'Men and women need different\nnutrition approaches',
                style: TextStyle(
                    color: Color.fromRGBO(65, 65, 67, .5), fontSize: sy(12)),
              ),
              Padding(
                padding: EdgeInsets.only(top: sy(50)),
                child: Row(
                  children: [
                    Card(
                      color: isSelected1 == false
                          ? Colors.white
                          : Color.fromRGBO(239, 66, 54, .75),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: sy(10), horizontal: sx(20)),
                        child: Column(
                          children: [
                            IconButton(
                                iconSize: sy(36),
                                onPressed: () {
                                  if (isSelected2 == true) {
                                    isSelected2 = false;
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
                                icon: Text(
                                  '👦🏻',
                                  style: TextStyle(fontSize: 30),
                                )
                                // Icon(FontAwesome.male,
                                //     color: isSelected1 == false
                                //         ? Color.fromRGBO(239, 66, 54, .75)
                                //         : Colors.white),
                                ),
                            Text(
                              'Male',
                              style: TextStyle(
                                  color: isSelected1 == false
                                      ? Color.fromRGBO(239, 66, 54, .75)
                                      : Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: isSelected2 == false
                          ? Colors.white
                          : Color.fromRGBO(239, 66, 54, .75),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: sy(10), horizontal: sx(20)),
                        child: Column(
                          children: [
                            IconButton(
                              iconSize: sy(36),
                              onPressed: () {
                                if (isSelected1 == true) {
                                  isSelected1 = false;
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
                              icon: Text('👩🏻', style: TextStyle(fontSize: 30)
                                  // color: isSelected2 == false
                                  //     ? Color.fromRGBO(239, 66, 54, .75)
                                  //     : Colors.white),
                                  ),
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                  color: isSelected2 == false
                                      ? Color.fromRGBO(239, 66, 54, .75)
                                      : Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
