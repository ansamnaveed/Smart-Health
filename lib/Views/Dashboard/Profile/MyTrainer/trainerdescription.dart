import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:smart_health/Views/Dashboard/Chat/chat_page.dart';

class TrainerDescription extends StatefulWidget {
  const TrainerDescription({Key key}) : super(key: key);

  @override
  _TrainerDescriptionState createState() => _TrainerDescriptionState();
}

class _TrainerDescriptionState extends State<TrainerDescription> {
  bool isFollow = false;

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
                            'https://images.medicinenet.com/images/article/main_image/what-are-push-ups-for.jpg'),
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
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('1.7k'),
                      Text('Followers'),
                    ],
                  ),
                  title: Text(
                    'Amenda Johnson',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  subtitle: Text('Fitness Trainer'),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      OutlineGradientButton(
                        padding: EdgeInsets.zero,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatPage(),
                            ),
                          );
                        },
                        elevation: 5,
                        radius: Radius.circular(30),
                        backgroundColor: Colors.white,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: sy(30),
                          alignment: Alignment.center,
                          child: GradientText(
                            'Message',
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color.fromRGBO(65, 65, 67, 1),
                                Color.fromRGBO(239, 66, 54, 1),
                              ],
                            ),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color.fromRGBO(65, 65, 67, 1),
                            Color.fromRGBO(239, 66, 54, 1),
                          ],
                        ),
                        strokeWidth: 2,
                      ),
                      Spacer(),
                      isFollow == true
                          ? OutlineGradientButton(
                              onTap: () {
                                setState(() {
                                  isFollow = false;
                                });
                              },
                              elevation: 5,
                              padding: EdgeInsets.zero,
                              radius: Radius.circular(30),
                              backgroundColor: Colors.white,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      Color.fromRGBO(65, 65, 67, 1),
                                      Color.fromRGBO(239, 66, 54, 1),
                                    ],
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width / 2.2,
                                height: sy(30),
                                alignment: Alignment.center,
                                child: Text(
                                  'Unfollow',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromRGBO(65, 65, 67, 1),
                                  Color.fromRGBO(239, 66, 54, 1),
                                ],
                              ),
                              strokeWidth: 2,
                            )
                          : OutlineGradientButton(
                              padding: EdgeInsets.zero,
                              onTap: () {
                                setState(() {
                                  isFollow = true;
                                });
                              },
                              elevation: 5,
                              radius: Radius.circular(30),
                              backgroundColor: Colors.white,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.2,
                                height: sy(30),
                                alignment: Alignment.center,
                                child: GradientText(
                                  'Follow',
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      Color.fromRGBO(65, 65, 67, 1),
                                      Color.fromRGBO(239, 66, 54, 1),
                                    ],
                                  ),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color.fromRGBO(65, 65, 67, 1),
                                  Color.fromRGBO(239, 66, 54, 1),
                                ],
                              ),
                              strokeWidth: 2,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
