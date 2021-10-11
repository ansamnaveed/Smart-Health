import 'package:fireauth/Views/Dashboard/HealthTips/healthdescription.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';

class FavoriteHealthTips extends StatefulWidget {
  const FavoriteHealthTips({Key key}) : super(key: key);

  @override
  _FavoriteHealthTipsState createState() => _FavoriteHealthTipsState();
}

class _FavoriteHealthTipsState extends State<FavoriteHealthTips> {
  List<String> myTips = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myTips.isEmpty
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
                    'Favorite HealthTips is Empty!',
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HealthTipsDescription(),
                      ),
                    );
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
                        child: Text(
                          '7 Minutes Workout',
                          style: TextStyle(color: Colors.blue, fontSize: 10),
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
