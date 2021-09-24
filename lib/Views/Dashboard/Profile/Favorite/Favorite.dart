import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import 'FavoriteHealthtips.dart';
import 'favoriteworkout.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, heigh, width, sy, sx) {
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
            'Favorites',
            style: TextStyle(
                fontSize: sy(18),
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 40,
                child: TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.red,
                  indicatorColor: Colors.red,
                  indicatorPadding: EdgeInsets.only(right: 30, left: 30),
                  tabs: [
                    Tab(text: "WorkOut"),
                    Tab(text: "Health Tips"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FavoriteWorkOut(),
                    FavoriteHealthTips(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
