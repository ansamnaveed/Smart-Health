import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:relative_scale/relative_scale.dart';

class Five extends StatefulWidget {
  const Five({Key key}) : super(key: key);

  @override
  _FiveState createState() => _FiveState();
}

class _FiveState extends State<Five> {
  int _currentValue = 20;

  @override
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
              '5 of 7',
              style: TextStyle(
                color: Color.fromRGBO(65, 65, 67, 0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: sy(10)),
              child: GradientText(
                'Your Current Weight',
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
              'Your weight is necrssary for\nestablishing a good nutrition plan',
              style: TextStyle(
                  color: Color.fromRGBO(65, 65, 67, .5), fontSize: sy(12)),
            ),
            Padding(
              padding: EdgeInsets.only(top: sy(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: sx(10)),
                        child: NumberPicker(
                          axis: Axis.horizontal,
                          itemWidth: sx(95),
                          itemCount: 5,
                          itemHeight: sy(40),
                          selectedTextStyle: TextStyle(
                              color: Color.fromRGBO(239, 66, 54, 1),
                              fontSize: sy(30)),
                          value: _currentValue,
                          minValue: 15,
                          maxValue: 200,
                          onChanged: (value) =>
                              setState(() => _currentValue = value),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 159,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sx(30)),
                      child: Image(
                        image: AssetImage('assets/images/weight1.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: sy(8.0)),
                    child: Text('kg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
