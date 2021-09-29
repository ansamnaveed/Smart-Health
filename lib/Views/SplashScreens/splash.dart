import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:smart_health/Views/SignInScreen/signin.dart';
import 'package:smart_health/Views/introscreens/intro.dart';
import 'package:smart_health/widgets/theme.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splashbg.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Container(
              padding: EdgeInsets.all(sy(20)),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(239, 66, 54, .7),
                    Color.fromRGBO(65, 65, 67, .7)
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: sy(10)),
                    padding: EdgeInsets.all(sy(10)),
                    width: sy(70),
                    height: sy(70),
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
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Smart Health ',
                          style: TextStyle(
                              fontSize: sy(18),
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      Color.fromRGBO(65, 65, 67, 1),
                                      Color.fromRGBO(239, 66, 54, 1),
                                    ],
                                  ),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 15.0,
                                      offset: Offset(0.0, 0.75),
                                    )
                                  ],
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: sy(70), bottom: sy(100)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sy(22),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'To the best diet and\ntraining app',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: sy(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  gradientButton(
                    'Sign Up',
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => IntroScreen(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: sy(10)),
                    child: OutlineGradientButton(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ),
                        );
                      },
                      elevation: 5,
                      radius: Radius.circular(30),
                      backgroundColor: Colors.white.withOpacity(.5),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        alignment: Alignment.center,
                        child: 
                        GradientText(
                          'Sign In',
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
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color.fromRGBO(65, 65, 67, 1),
                          Color.fromRGBO(239, 66, 54, 1),
                        ],
                      ),
                      strokeWidth: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
