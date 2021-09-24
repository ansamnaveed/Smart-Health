import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:smart_health/Views/SignUpScreens/signup.dart';
import 'package:smart_health/widgets/theme.dart';

import 'startIntro.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: sy(40)),
                  child: Image.asset('assets/images/intro0.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: sy(20), bottom: sy(50)),
                  child: Text(
                    'The key to a healthy diet is\nto eat the right amount of calories',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(65, 65, 67, .5),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: sy(50)),
                  child: gradientButton('Take Our Advice', () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StartIntro(),
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: sy(30)),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        'Skip This',
                        style: TextStyle(
                          color: Color.fromRGBO(239, 66, 54, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
