import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:relative_scale/relative_scale.dart';

class Training extends StatefulWidget {
  const Training({Key key}) : super(key: key);

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(seconds: 1),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: GradientText(
              'Training',
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromRGBO(65, 65, 67, 1),
                  Color.fromRGBO(239, 66, 54, 1),
                ],
              ),
              style: TextStyle(fontSize: sy(24), fontWeight: FontWeight.bold),
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
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    height: sy(170),
                    width: double.infinity,
                    child: PageView.builder(
                      allowImplicitScrolling: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: 5,
                      // itemCount: popularBooks == null ? 0 : popularBooks.length,
                      controller: _pageController,
                      itemBuilder: (_, i) {
                        return Container(
                          margin: EdgeInsets.only(right: 2.5, left: 2.5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://d2z0k43lzfi12d.cloudfront.net/blog/vcdn333/wp-content/uploads/2018/08/thumbnail_1200x800-1-1024x683.jpg',
                                ),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          // height: 150,
                          width: double.infinity,
                          child: Container(
                            padding: EdgeInsets.all(sy(20)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Colors.transparent,
                                  Color.fromRGBO(239, 66, 54, .5),
                                ],
                              ),
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Next Workout',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: sy(10)),
                                  child: Text(
                                    'Legs Toning and\nGlutes Workout at Home',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: sy(16)),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.timelapse,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      ' 68 min',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: sx(75),
                                      height: sx(75),
                                      child: ElevatedButton(
                                        child: Icon(
                                          Icons.play_arrow_rounded,
                                          color: Colors.grey,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          primary:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: sy(10)),
                        margin: EdgeInsets.symmetric(vertical: sy(20)),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 2.0,
                              spreadRadius: -1,
                              offset: Offset(1, 1),
                            )
                          ],
                        ),
                        child: ListTile(
                          leading: SizedBox(
                            width: sx(175),
                          ),
                          title: Text(
                            "You're doing great!",
                            style: TextStyle(
                                color: Color.fromRGBO(239, 65, 54, 1)),
                          ),
                          subtitle: Text('Keep it up\nand stick to your plan!'),
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/images/run1.png'),
                        height: sy(95),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Quick Home Workout Plan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    // itemCount: popular == null ? 0 : popular.length,
                    itemBuilder: (_, i) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                          width: 100,
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
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        'Flat Abs Workout Plan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    // itemCount: popular == null ? 0 : popular.length,
                    itemBuilder: (_, i) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                          width: 100,
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
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: sy(75),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
