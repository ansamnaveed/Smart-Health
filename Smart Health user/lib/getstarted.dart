import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'Views/SplashScreens/splash.dart';
import 'Widgets/theme.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/giphy.gif'), fit: BoxFit.cover),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(65, 65, 67, .7),
                Color.fromRGBO(239, 66, 54, .3),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 10),
                padding: EdgeInsets.all(10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75),
                    )
                  ],
                ),
                child: Image(
                  image: AssetImage('assets/images/onlylogo.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    text: 'Smart Health ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black54.withOpacity(.5),
                            offset: Offset(0.0, 0.75),
                            blurRadius: 5.0,
                          ),
                        ],
                        color: Colors.white),
                    children: [
                      WidgetSpan(
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 0.75),
                              )
                            ],
                          ),
                          child: GradientText(
                            '+',
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color.fromRGBO(65, 65, 67, 1),
                                Color.fromRGBO(239, 66, 54, 1),
                              ],
                            ),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: gradientButton('Get Started', () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Splash(),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
