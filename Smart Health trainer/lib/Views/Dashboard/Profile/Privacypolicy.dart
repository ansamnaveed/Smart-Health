import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
              'Privacy Policy',
              style: TextStyle(
                  fontSize: sy(18),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget orci magna. Pellentesque cursus libero ut lectus accumsan euismod. Vivamus vitae sollicitudin purus. Cras porttitor tristique leo, non blandit libero porta nec. Maecenas arcu augue, facilisis et vehicula a, aliquam in ex. Vivamus dignissim eros vitae enim auctor, ac elementum arcu accumsan. Fusce venenatis, mi a congue auctor, diam leo posuere justo, ut venenatis tortor nunc sed nulla. Donec condimentum mattis lorem quis rhoncus. Quisque dapibus leo mi, rhoncus cursus enim gravida sed. Sed id diam orci. Pellentesque magna odio, dictum vitae iaculis et, faucibus at orci. Nam a eros arcu.
          
          Maecenas convallis nunc sem, non eleifend nunc finibus eget. Praesent et est lacinia, fermentum purus id, mattis nulla. Curabitur aliquet sem sit amet lorem sollicitudin interdum. Sed semper sodales ligula a imperdiet. Duis erat est, cursus ut ipsum quis, aliquet blandit libero. Pellentesque eget est eros. Pellentesque aliquet libero at massa imperdiet dapibus. Donec in libero a ligula aliquam gravida vel vitae sem. In in est tellus. Donec sagittis dignissim mi, ut convallis tellus blandit ut.
          
          Donec fermentum, lectus id placerat fringilla, urna odio vehicula libero, id auctor dolor eros et velit. Curabitur imperdiet posuere turpis. Duis blandit eros eget turpis pellentesque vestibulum. Suspendisse potenti. Aenean in rutrum elit. Phasellus sit amet aliquam libero. Donec vitae nisl quam. Proin non risus erat.
          
          In ornare suscipit ultricies. Sed ut quam purus. Praesent auctor vitae urna at laoreet. Pellentesque tellus ligula, mattis in quam eu, maximus ultrices felis. In fermentum velit eget est bibendum venenatis. Maecenas accumsan lectus ex, nec ultrices mi volutpat ac. Nulla gravida purus vitae sodales scelerisque. Vestibulum sed erat mattis urna rutrum facilisis.
          
          Maecenas molestie diam id nulla blandit sollicitudin. Aenean cursus ex quis nisi porttitor, eu rhoncus justo laoreet. Integer rhoncus ligula ac neque cursus congue. Maecenas commodo fermentum sodales. Sed facilisis felis et nunc pulvinar, a sagittis nisi interdum. Aliquam venenatis congue euismod. Phasellus at fermentum nunc. Praesent eu feugiat est. Maecenas elit nunc, placerat sit amet tellus non, rutrum posuere turpis. Fusce in lacus sit amet neque commodo interdum. Vivamus non lorem a turpis egestas posuere. Mauris volutpat ultrices ante. Phasellus vitae dolor in justo dapibus maximus eu at lorem.''',
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        );
      },
    );
  }
}
