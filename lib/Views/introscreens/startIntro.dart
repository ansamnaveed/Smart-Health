import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:smart_health/Views/SignUpScreens/signup.dart';
import 'package:smart_health/Views/introscreens/introSlider/five.dart';
import 'package:smart_health/Views/introscreens/introSlider/four.dart';
import 'package:smart_health/Views/introscreens/introSlider/one.dart';
import 'package:smart_health/Views/introscreens/introSlider/three.dart';
import 'package:smart_health/Views/introscreens/introSlider/two.dart';
import 'package:smart_health/widgets/theme.dart';

import 'introSlider/six.dart';

class StartIntro extends StatefulWidget {
  const StartIntro({Key key}) : super(key: key);

  @override
  _StartIntroState createState() => _StartIntroState();
}

class _StartIntroState extends State<StartIntro> {
  @override
  void initState() {
    super.initState();
    bottomIndex = 0;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height / 1.1,
        child: bottomIndex == 0
            ? One()
            : bottomIndex == 1
                ? Two()
                : bottomIndex == 2
                    ? Three()
                    : bottomIndex == 3
                        ? Four()
                        : bottomIndex == 4
                            ? Five()
                            : bottomIndex == 5
                                ? Six()
                                : Container,
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
          ),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black54,
              blurRadius: 5.0,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
          ),
          child: BottomAppBar(
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomIndex == 0
                      ? Container(
                          width: 0,
                          height: 0,
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              bottomIndex = bottomIndex - 1;
                            });
                          },
                          icon: Icon(Icons.arrow_back_rounded),
                        ),
                  bottomIndex == 5
                      ? InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GradientText(
                              'Done',
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromRGBO(65, 65, 67, 1),
                                  Color.fromRGBO(239, 66, 54, 1),
                                ],
                              ),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                bottomIndex = bottomIndex + 1;
                              });
                            },
                            child: GradientText(
                              'Continue',
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromRGBO(65, 65, 67, 1),
                                  Color.fromRGBO(239, 66, 54, 1),
                                ],
                              ),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
