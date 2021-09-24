import 'dart:io';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:smart_health/widgets/theme.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File picked;
  Future pickImage(ImageSource source) async {
    try {
      final picked = await ImagePicker().pickImage(source: source);

      if (picked == null) return;

      final imageTemporary = File(picked.path);
      setState(() {
        this.picked = imageTemporary;
        profilePicture = imageTemporary;
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message.toString()),
        ),
      );
    }
  }

  void _sendDataBack(BuildContext context) {
    Navigator.pop(context, picked);
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: profilePicture.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                // CropAspectRatioPreset.ratio3x2,
                // CropAspectRatioPreset.original,
                // CropAspectRatioPreset.ratio4x3,
                // CropAspectRatioPreset.ratio16x9
              ]
            : [
                // CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                // CropAspectRatioPreset.ratio3x2,
                // CropAspectRatioPreset.ratio4x3,
                // CropAspectRatioPreset.ratio5x3,
                // CropAspectRatioPreset.ratio5x4,
                // CropAspectRatioPreset.ratio7x5,
                // CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Edit Image',
            toolbarColor: Colors.green,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Edit Image',
        ));
    if (croppedFile != null) {
      setState(() {
        profilePicture = croppedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, heigh, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                _sendDataBack(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color.fromRGBO(65, 65, 67, 1),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Account Setting',
              style: TextStyle(
                  fontSize: sy(18),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        contentPadding: EdgeInsets.all(3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        // contentPadding: EdgeInsets.all(0),
                        content: profilePicture != null
                            ? Image.file(profilePicture)
                            : Container(
                                width: 100,
                                height: 200,
                                child: Icon(
                                  FontAwesome.user_secret,
                                  size: 50,
                                ),
                              ),
                      ),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //     image: AssetImage(image), fit: BoxFit.fitHeight),
                      color: Colors.grey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipOval(
                      child: profilePicture != null
                          ? Image.file(profilePicture)
                          : Icon(FontAwesome.user_secret, size: 50),
                    ),
                  ),
                ),
                GradientButton(
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  ),
                  callback: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => Container(
                        color: Color(0xff757575),
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 10, left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(
                                child: Icon(Icons.drag_handle_rounded),
                              ),
                              TextButton(
                                onPressed: () {
                                  _cropImage();
                                },
                                // => pickImage(ImageSource.camera),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: <Color>[
                                              Color.fromRGBO(65, 65, 67, 1),
                                              Color.fromRGBO(239, 66, 54, 1),
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Icon(
                                        Icons.crop,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Edit photo',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  pickImage(ImageSource.camera);
                                },
                                // => pickImage(ImageSource.camera),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: <Color>[
                                              Color.fromRGBO(65, 65, 67, 1),
                                              Color.fromRGBO(239, 66, 54, 1),
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Icon(
                                        Linecons.camera,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Take photo',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  pickImage(ImageSource.gallery);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: <Color>[
                                              Color.fromRGBO(65, 65, 67, 1),
                                              Color.fromRGBO(239, 66, 54, 1),
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Icon(
                                        Linecons.photo,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Select from gallery',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  shapeRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color.fromRGBO(65, 65, 67, 1),
                      Color.fromRGBO(239, 66, 54, 1),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: sy(20)),
                      child: Text(
                        'Email',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2.0,
                                spreadRadius: -1,
                                offset: Offset(1, 1),
                              )
                            ]),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: sx(20)),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(118, 129, 150, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: sx(20)),
                              child: Text(
                                'First Name',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 2.0,
                                        spreadRadius: -1,
                                        offset: Offset(1, 1),
                                      )
                                    ]),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: sx(20)),
                                    hintText: "First Name",
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(118, 129, 150, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: sx(20)),
                              child: Text(
                                'Last Name',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 2.0,
                                        spreadRadius: -1,
                                        offset: Offset(1, 1),
                                      )
                                    ]),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: sx(20)),
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(118, 129, 150, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: sx(20)),
                      child: Text(
                        'Password',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
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
                        child: TextFormField(
                          obscureText: true,
                          obscuringCharacter: '.',
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: sx(20)),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(118, 129, 150, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 8),
                      child: gradientButton(
                        'Submit',
                        () {
                          _sendDataBack(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
