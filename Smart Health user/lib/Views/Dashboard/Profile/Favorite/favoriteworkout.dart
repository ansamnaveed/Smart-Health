import 'package:fireauth/Views/Dashboard/SearchScreens/workout.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';

class FavoriteWorkOut extends StatefulWidget {
  const FavoriteWorkOut({Key key}) : super(key: key);

  @override
  _FavoriteWorkOutState createState() => _FavoriteWorkOutState();
}

class _FavoriteWorkOutState extends State<FavoriteWorkOut> {
  List<String> myWorkOut = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myWorkOut.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Linecons.heart,
                    color: Colors.grey.withOpacity(.3),
                    size: 100,
                  ),
                  Text(
                    'Favorite WorkOut is Empty!',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.withOpacity(.3),
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              // itemCount: popular == null ? 0 : popular.length,
              itemBuilder: (_, i) {
                return InkWell(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => WorkOutScreen(),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '7 Minutes Workout',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 10),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse_rounded,
                                  color: Colors.grey,
                                  size: 10,
                                ),
                                Text(
                                  '20 min',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
