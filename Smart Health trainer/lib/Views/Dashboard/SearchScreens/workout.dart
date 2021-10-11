import 'package:fireauth/Widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:relative_scale/relative_scale.dart';

import 'workoutexcercise.dart';

class WorkOutScreen extends StatefulWidget {
  WorkOutScreen({Key key}) : super(key: key);

  @override
  _WorkOutScreenState createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  void initState() {
    super.initState();
    isWatched = false;
  }

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
              'WorkOut Name',
              style: TextStyle(
                  fontSize: sy(18),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: RatingBar(
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
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                          spreadRadius: -1,
                          offset: Offset(1, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://daman.co.id/daman.co.id/wp-content/uploads/2020/03/Weight-Loss-Exercises-for-Men-At-Home.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.bottomLeft,
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.transparent,
                            Color.fromRGBO(239, 66, 54, .5),
                          ],
                        ),
                      ),
                      child: Text(
                        '7 Minutes Workout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  color: Color.fromRGBO(239, 65, 54, .75),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total: 6 Excercises',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Time: 15 Minutes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 1,
                        color: Colors.white,
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Energy you'll burn",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '250 Calories',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.medicinenet.com/images/article/main_image/what-are-push-ups-for.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: isWatched == false
                                ? Color.fromRGBO(65, 65, 67, 1)
                                : Color.fromRGBO(239, 65, 54, 1),
                            width: 2),
                      ),
                    ),
                    trailing: isWatched == false
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Remaining',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          )
                        : Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                    title: Text('Push-ups'),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Time: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '2 mins',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Burns: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '65 Calories',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.medicinenet.com/images/article/main_image/what-are-push-ups-for.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: isWatched == false
                                ? Color.fromRGBO(65, 65, 67, 1)
                                : Color.fromRGBO(239, 65, 54, 1),
                            width: 2),
                      ),
                    ),
                    trailing: isWatched == false
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Remaining',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          )
                        : Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                    title: Text('Push-ups'),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Time: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '2 mins',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Burns: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '65 Calories',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.medicinenet.com/images/article/main_image/what-are-push-ups-for.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: isWatched == false
                                ? Color.fromRGBO(65, 65, 67, 1)
                                : Color.fromRGBO(239, 65, 54, 1),
                            width: 2),
                      ),
                    ),
                    trailing: isWatched == false
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Remaining',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          )
                        : Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                    title: Text('Push-ups'),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Time: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '2 mins',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Burns: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '65 Calories',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.medicinenet.com/images/article/main_image/what-are-push-ups-for.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: isWatched == false
                                ? Color.fromRGBO(65, 65, 67, 1)
                                : Color.fromRGBO(239, 65, 54, 1),
                            width: 2),
                      ),
                    ),
                    trailing: isWatched == false
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Remaining',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          )
                        : Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                    title: Text('Push-ups'),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Time: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '2 mins',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Burns: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '65 Calories',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: Colors.transparent,
            elevation: 0,
            label: Container(
              width: 150,
              child: gradientButton("Start Workout", () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WorkOutExcercise(),
                  ),
                );
                setState(() {
                  isWatched = true;
                });
              }),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
