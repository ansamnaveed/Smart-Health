import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:relative_scale/relative_scale.dart';

class Eight extends StatefulWidget {
  const Eight({Key key}) : super(key: key);

  @override
  _EightState createState() => _EightState();
}

class _EightState extends State<Eight> {
  bool selected = false;
  bool selected2 = false;
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
                  'Healthy or Unhealthy?',
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
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ExpansionTile(
                          title: GradientText(
                            'Healthy',
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color.fromRGBO(239, 66, 54, .75),
                                Color.fromRGBO(65, 65, 67, 1),
                              ],
                            ),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: [
                            CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                  "Interested in Excercise/Workout/Walking"),
                              value: selected2,
                              onChanged: (value) {
                                setState(() {
                                  selected2 = value;
                                });
                              },
                            ),
                            CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Diet"),
                              value: selected,
                              onChanged: (value) {
                                setState(() {
                                  selected = value;
                                });
                              },
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: GradientText(
                            'Unhealthy',
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color.fromRGBO(239, 66, 54, .75),
                                Color.fromRGBO(65, 65, 67, 1),
                              ],
                            ),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: [
                            CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Diabetic"),
                              value: selected2,
                              onChanged: (value) {
                                setState(() {
                                  selected2 = value;
                                });
                              },
                            ),
                            CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Low BloodPressure"),
                              value: selected,
                              onChanged: (value) {
                                setState(() {
                                  selected = value;
                                });
                              },
                            ),
                            CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("High BloodPressure"),
                              value: selected,
                              onChanged: (value) {
                                setState(() {
                                  selected = value;
                                });
                              },
                            ),
                            CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Heart Patient"),
                              value: selected,
                              onChanged: (value) {
                                setState(() {
                                  selected = value;
                                });
                              },
                            )
                          ],
                        ),
                      ],
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
