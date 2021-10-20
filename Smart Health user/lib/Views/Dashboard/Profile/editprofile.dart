import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fireauth/Views/Dashboard/Profile/userprofile.dart';
import 'package:fireauth/Widgets/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart' as storage;

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User user = FirebaseAuth.instance.currentUser;

  Future _camImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );

      if (pickedFile == null) {
        return;
      }
      var file = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      );
      if (file == null) {
        return;
      }

      file = await compressImage(file.path, 35);

      await _uploadFile(file.path);
    } catch (e) {
      print('Error: ' + e);
    }
  }

  Future _galleryImage() async {
    try {
      FilePickerResult result =
          await FilePicker.platform.pickFiles(type: FileType.image);

      final pickedFile = File(result.files.single.path);

      if (pickedFile == null) {
        return;
      }
      var file = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      );
      if (file == null) {
        return;
      }

      file = await compressImage(file.path, 35);

      await _uploadFile(file.path);
    } catch (e) {
      print('Error: ' + e);
    }
  }

  String fileUrl;

  Future _uploadFile(String path) async {
    final ref = storage.FirebaseStorage.instance
        .ref()
        .child('images')
        .child('${DateTime.now().toIso8601String() + p.basename(path)}');

    final result = await ref.putFile(File(path));
    setState(
      () async {
        fileUrl = await result.ref.getDownloadURL();
      },
    );
  }

  update(String image) async {
    getData();
    await FirebaseFirestore.instance
        .collection(user.email)
        .doc("Account")
        .update(
      {
        "imageUrl": image,
      },
    );
  }

  Future<File> compressImage(String path, int quality) async {
    final newPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}.${p.extension(path)}');

    final result = await FlutterImageCompress.compressAndGetFile(
      path,
      newPath,
      quality: quality,
    );

    return result;
  }

  String fname;
  String lname;

  bool show = false;

  final FirebaseAuth auth = FirebaseAuth.instance;

  void getData() async {
    final User user = auth.currentUser;
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection(user.email)
        .doc("Account")
        .get();
    setState(
      () {
        fname = variable['firstname'];
        lname = variable['lastname'];
        fileUrl = variable['imageUrl'];
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfile(),
                  ),
                );
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
          body: user.email == null
              //  || password == null
              ? Center(
                  child: Icon(
                    Fontelico.spin6,
                  ),
                )
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(0),
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(0),
                                content: fileUrl != ""
                                    ? Image.network(fileUrl)
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
                              color: Colors.grey.withOpacity(.3),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipOval(
                              child: fileUrl != ''
                                  ? Image.network(fileUrl)
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
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
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
                                          _camImage();
                                        },
                                        // => pickImage(ImageSource.camera),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: <Color>[
                                                      Color.fromRGBO(
                                                          65, 65, 67, 1),
                                                      Color.fromRGBO(
                                                          239, 66, 54, 1),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Icon(
                                                Linecons.camera,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'Take photo',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _galleryImage();
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: <Color>[
                                                      Color.fromRGBO(
                                                          65, 65, 67, 1),
                                                      Color.fromRGBO(
                                                          239, 66, 54, 1),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Icon(
                                                Linecons.photo,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'Select from gallery',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            fileUrl = 'null';
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: <Color>[
                                                      Color.fromRGBO(
                                                          65, 65, 67, 1),
                                                      Color.fromRGBO(
                                                          239, 66, 54, 1),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Icon(
                                                Linecons.photo,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              'Remove Photo',
                                              style: TextStyle(
                                                  color: Colors.black),
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
                              padding: EdgeInsets.only(left: sx(20)),
                              child: Text(
                                'First Name',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
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
                                  initialValue: fname,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: sx(20)),
                                    hintText: 'First Name',
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(118, 129, 150, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                  initialValue: lname,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: sx(20)),
                                    hintText: 'Last Name',
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(118, 129, 150, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 8),
                          child: gradientButton(
                            'Update',
                            () {
                              update(fileUrl);
                            },
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
