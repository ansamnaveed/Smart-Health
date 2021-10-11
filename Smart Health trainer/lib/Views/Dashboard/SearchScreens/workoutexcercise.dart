import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:relative_scale/relative_scale.dart';

class WorkOutExcercise extends StatefulWidget {
  const WorkOutExcercise({Key key}) : super(key: key);

  @override
  _WorkOutExcerciseState createState() => _WorkOutExcerciseState();
}

class _WorkOutExcerciseState extends State<WorkOutExcercise> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return SafeArea(
          child: 
          Scaffold(
            body: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.lowgif.com/full/da648a77ef5176b8-.gif'),
                        fit: BoxFit.cover),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Set 1/3',
                  style: TextStyle(color: Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'LateRale Jump',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '00:34',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: sx(75),
                        height: sx(75),
                        child: ElevatedButton(
                          child: 
                          RatingBar(
                            initialRating: 0,
                            direction: Axis.horizontal,
                            itemCount: 1,
                            itemSize: 25,
                            ratingWidget: RatingWidget(
                              full: Icon(
                                Icons.favorite_rounded,
                                color: Color.fromRGBO(239, 65, 54, 1),
                              ),
                              empty: Icon(
                                Icons.favorite_border_rounded,
                                color: Color.fromRGBO(65, 65, 67, 1),
                              ),
                              half: null,
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            primary: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: sx(100),
                        height: sx(100),
                        child: ElevatedButton(
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            primary: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: sx(75),
                        height: sx(75),
                        child: ElevatedButton(
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: Color.fromRGBO(65, 65, 67, 1),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            primary: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
