import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:relative_scale/relative_scale.dart';

class Four extends StatefulWidget {
  const Four({Key key}) : super(key: key);

  @override
  _FourState createState() => _FourState();
}

class _FourState extends State<Four> {
  int _currentValue = 100;

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
                '4 of 6',
                style: TextStyle(
                  color: Color.fromRGBO(65, 65, 67, 0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: sy(10)),
                child: GradientText(
                  'How tall are you?',
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
                'Your height is necrssary for\nestablishing a good nutrition plan',
                style: TextStyle(
                    color: Color.fromRGBO(65, 65, 67, .5), fontSize: sy(12)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('cm'),
                  ),
                  NumberPicker(
                    itemWidth: sx(120),
                    itemCount: 3,
                    itemHeight: sy(65),
                    selectedTextStyle: TextStyle(
                        color: Color.fromRGBO(239, 66, 54, 1),
                        fontSize: sy(26)),
                    textStyle: TextStyle(
                      color: Color.fromRGBO(65, 65, 67, .5),
                    ),
                    value: _currentValue,
                    minValue: 50,
                    maxValue: 200,
                    onChanged: (value) => setState(() => _currentValue = value),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image(
                      image: AssetImage('assets/images/ruler.png'),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
