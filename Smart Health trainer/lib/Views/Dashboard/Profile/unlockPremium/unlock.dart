import 'package:flutter/material.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:relative_scale/relative_scale.dart';

class UnlockPremium extends StatefulWidget {
  const UnlockPremium({Key key}) : super(key: key);

  @override
  _UnlockPremiumState createState() => _UnlockPremiumState();
}

class _UnlockPremiumState extends State<UnlockPremium> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
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
              'Unlock Premium',
              style: TextStyle(
                  fontSize: sy(18),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    minVerticalPadding: 15,
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
                            'Free Trail',
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
                            'Free Trail',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                    subtitle: Text(
                      '14 Days',
                      style: TextStyle(
                        color: isSelected1 == false
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
                    minVerticalPadding: 15,
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
                            'Medium',
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
                            'Medium',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                    subtitle: Text(
                      'Access to all content, all workout and all health tips.',
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
                    minVerticalPadding: 15,
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
                            'Premium',
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
                            'Premium',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                    subtitle: Text(
                      'Access to all content, all workout ,all health tips and chat with trainer.',
                      style: TextStyle(
                        color: isSelected3 == false
                            ? Color.fromRGBO(65, 65, 67, .5)
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                OutlineGradientButton(
                  padding: EdgeInsets.zero,
                  onTap: () {
                    if (isSelected1 == true ||
                        isSelected2 == true ||
                        isSelected3 == true) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          contentPadding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          // contentPadding: EdgeInsets.all(0),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      Color.fromRGBO(65, 65, 67, 1),
                                      Color.fromRGBO(239, 66, 54, .75),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    WebSymbols.ok,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: GradientText(
                                  'Success',
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      Color.fromRGBO(65, 65, 67, 1),
                                      Color.fromRGBO(239, 66, 54, 1),
                                    ],
                                  ),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  elevation: 5,
                  radius: Radius.circular(30),
                  backgroundColor: Colors.white,
                  child: Container(
                    width: double.infinity,
                    height: sy(30),
                    alignment: Alignment.center,
                    child: GradientText(
                      isSelected1 == true
                          ? 'Pay \$ 0.00'
                          : isSelected2 == true
                              ? 'Pay \$ 5.00 Per Month'
                              : isSelected3 == true
                                  ? 'Pay \$ 10.00 Per Month'
                                  : 'Select a Plan First',
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
              ],
            ),
          ),
        );
      },
    );
  }
}
