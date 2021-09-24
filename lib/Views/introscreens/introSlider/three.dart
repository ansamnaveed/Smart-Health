import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:relative_scale/relative_scale.dart';

class Three extends StatefulWidget {
  const Three({Key key}) : super(key: key);

  @override
  _ThreeState createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  int _currentValue = 15;
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, heigh, width, sy, sx) {
      return Padding(
        padding: EdgeInsets.only(left: sx(20), right: sx(20), top: sy(70)),
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '3 of 6',
              style: TextStyle(
                color: Color.fromRGBO(65, 65, 67, 0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: sy(10)),
              child: GradientText(
                'How old are you?',
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color.fromRGBO(65, 65, 67, 1),
                    Color.fromRGBO(239, 66, 54, 1),
                  ],
                ),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: sy(24)),
              ),
            ),
            Text(
              'Your age is necrssary for establishing\nan appropriate plan',
              style: TextStyle(
                  color: Color.fromRGBO(65, 65, 67, .5), fontSize: sy(12)),
            ),
            Padding(
              padding: EdgeInsets.only(top: sy(0)),
              child: Center(
                child: NumberPicker(
                  itemHeight: sy(50),
                  itemCount: 5,
                  itemWidth: MediaQuery.of(context).size.width / 2.5,
                  selectedTextStyle: TextStyle(
                      color: Color.fromRGBO(239, 66, 54, 1),
                      fontSize: sy(22),
                      fontWeight: FontWeight.bold),
                  textStyle: TextStyle(
                    color: Color.fromRGBO(65, 65, 67, .5),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: Color.fromRGBO(239, 66, 54, 1),
                      ),
                      bottom: BorderSide(
                        width: 2,
                        color: Color.fromRGBO(239, 66, 54, 1),
                      ),
                    ),
                  ),
                  value: _currentValue,
                  minValue: 0,
                  maxValue: 100,
                  onChanged: (value) => setState(() => _currentValue = value),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
