import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:relative_scale/relative_scale.dart';

class Six extends StatefulWidget {
  const Six({Key key}) : super(key: key);

  @override
  _SixState createState() => _SixState();
}

class _SixState extends State<Six> {
  double _currentValue = 50;
  String lose = '';
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
                '6 of 7',
                style: TextStyle(
                  color: Color.fromRGBO(65, 65, 67, 0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: sy(10)),
                child: GradientText(
                  'How long you wish till\nyou reach this goal?',
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: sy(50)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 20,
                        activeTrackColor: Color.fromRGBO(65, 65, 67, 0.5),
                        thumbColor: Color.fromRGBO(239, 65, 54, 1),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: <Widget>[
                                marker(text: '1', left: sx(50)),
                                marker(text: '100', left: sx(400)),
                              ],
                            ),
                          ),
                          Slider(
                            value: _currentValue,
                            min: 1,
                            max: 100,
                            divisions: 100,
                            label: _currentValue.round().toString(),
                            onChanged: ((value) {
                              setState(
                                () {
                                  _currentValue = value;
                                  lose = (1 - (_currentValue / 100))
                                      .toStringAsFixed(2);
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Text(
                '${_currentValue.round()} Weeks - Gradual',
                style: TextStyle(
                  fontSize: sy(16),
                  color: Color.fromRGBO(239, 66, 54, 1),
                ),
              ),
              Text(
                'Lose : $lose kg / weeks',
                style: TextStyle(
                  fontSize: sy(12),
                  color: Color.fromRGBO(65, 65, 67, 1),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget marker({String text, double left}) {
    return Container(
      margin: EdgeInsets.only(left: left),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
