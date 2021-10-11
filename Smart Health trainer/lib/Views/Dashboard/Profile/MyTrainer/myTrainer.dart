import 'package:fireauth/Views/Dashboard/Profile/MyTrainer/trainerdescription.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class MyTrainer extends StatefulWidget {
  const MyTrainer({Key key}) : super(key: key);

  @override
  _MyTrainerState createState() => _MyTrainerState();
}

class _MyTrainerState extends State<MyTrainer> {
  @override
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
              'My Trainer',
              style: TextStyle(
                  fontSize: sy(18),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: sy(5)),
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainerDescription(),
                            ));
                      },
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      leading: Container(
                        width: sx(120),
                        height: sx(120),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.medicinenet.com/images/article/main_image/what-are-push-ups-for.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      title: Text('Amenda Johnson'),
                      subtitle: Text('Fitness Trainer'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
