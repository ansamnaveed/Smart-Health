import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:relative_scale/relative_scale.dart';

class HealthTipsDescription extends StatefulWidget {
  const HealthTipsDescription({Key key}) : super(key: key);

  @override
  _HealthTipsDescriptionState createState() => _HealthTipsDescriptionState();
}

class _HealthTipsDescriptionState extends State<HealthTipsDescription> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://daman.co.id/daman.co.id/wp-content/uploads/2020/03/Weight-Loss-Exercises-for-Men-At-Home.jpg'),
                        fit: BoxFit.cover),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  trailing: 
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
                    onRatingUpdate: (double value) {
                      final snackBar = SnackBar(
                        content: Text(value == 1
                            ? 'Added to favorite'
                            : 'Removed from favorite'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                  title: Text(
                    'Maintain a healthy weight',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: 
                  ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.medicinenet.com/images/article/main_image/what-are-push-ups-for.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    trailing: InkWell(
                      onTap: () {},
                      child: Text(
                        'View More',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    title: Text('Olivier Heyden'),
                    subtitle: Text(
                      'Fitness Trainer',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
                      ],
                    ),
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
