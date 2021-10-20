import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fireauth/Widgets/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:fireauth/Views/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class NewWorkout extends StatefulWidget {
  const NewWorkout({Key key}) : super(key: key);

  @override
  _NewWorkoutState createState() => _NewWorkoutState();
}

class _NewWorkoutState extends State<NewWorkout> {
  String fileUrl;
  String excercise;
  File fileVideo;
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

  bool tap = false;

  Future _camVideo() async {
    try {
      final pickedVideo = await ImagePicker().pickVideo(
        source: ImageSource.camera,
        maxDuration: Duration(minutes: 2),
      );

      if (pickedVideo == null) {
        return;
      } else {
        setState(() {
          tap = true;
        });
      }

      await _uploadVideo(pickedVideo.path);
    } catch (e) {}
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
        aspectRatio: CropAspectRatio(ratioX: 2, ratioY: 1),
      );
      if (file == null) {
        return;
      }

      file = await compressImage(file.path, 35);

      await _uploadFile(file.path);
    } catch (e) {
      print('Error: ' + e.toString());
    }
  }

  Future _galleryVideo() async {
    try {
      FilePickerResult result =
          await FilePicker.platform.pickFiles(type: FileType.video);

      final pickedVideo = File(result.files.single.path);

      if (pickedVideo == null) {
        return;
      } else {
        setState(() {
          tap = true;
        });
      }

      await _uploadVideo(pickedVideo.path);
    } catch (e) {
      print('Error: ' + e.toString());
    }
  }

  Future _uploadFile(String path) async {
    final ref = storage.FirebaseStorage.instance
        .ref()
        .child(FirebaseAuth.instance.currentUser.uid + "'s workouts")
        .child('${DateTime.now().toIso8601String() + p.basename(path)}');

    final result = await ref.putFile(File(path));

    String url = await result.ref.getDownloadURL();
    setState(
      () {
        fileUrl = url;
      },
    );
  }

  Future _uploadVideo(String path) async {
    final ref = storage.FirebaseStorage.instance
        .ref()
        .child(FirebaseAuth.instance.currentUser.uid + "'s workouts")
        .child('${DateTime.now().toIso8601String() + p.basename(path)}');

    final result = await ref.putFile(File(path));

    String url = await result.ref.getDownloadURL();
    setState(
      () {
        excercise = url;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Workout',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => EndIntro(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'WorkOut Name',
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
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintText: "Name",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(118, 129, 150, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Duration of Workout',
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
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    controller: durationController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintText: "Duration in Minutes",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(118, 129, 150, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Description',
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
                    maxLines: 5,
                    controller: descriptionController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      hintText: "Description...",
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(118, 129, 150, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Thumbnail',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
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
                                  _camImage();
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
                                  _galleryImage();
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
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    fileUrl = 'null';
                                  });
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
                                      'Remove Photo',
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
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 5,
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
                    child: fileUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              fileUrl,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo_rounded),
                              Text('No thumbnail selected')
                            ],
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Excercise',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
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
                                  Navigator.pop(context);
                                  _camVideo();
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
                                  Navigator.pop(context);
                                  _galleryVideo();
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
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 5,
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
                    child: excercise != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.cloud_done_rounded),
                              Text('Vedio Uploaded')
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              tap == false
                                  ? Icon(Entypo.video)
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                              tap == false
                                  ? Text('No excercise selected')
                                  : Text('Uploading....')
                            ],
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: gradientButton(
                  "Submit",
                  () {
                    uploadWorkout();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  int docNumber;
  uploadWorkout() async {
    User user = FirebaseAuth.instance.currentUser;
    final String name = nameController.text.trim();
    final String description = descriptionController.text.trim();
    final String duration = durationController.text.trim();
    final String thumbUrl = fileUrl;
    final String workoutUrl = excercise;
    DocumentSnapshot userName = await FirebaseFirestore.instance
        .collection(user.email)
        .doc("Workouts")
        .get();
    String firstname = userName['firstname'];
    DocumentSnapshot docFromFname = await FirebaseFirestore.instance
        .collection(user.email)
        .doc("$docNumber")
        .get();
    if (docNumber == null) {
      setState(() {
        docNumber = 0;
      });
    } else {
      setState(() {
        docNumber = docFromFname['docNumber'];
      });
    }
    await FirebaseFirestore.instance
        .collection("$userName's Workouts")
        .doc('${docNumber + 1}')
        .set(
      {
        'name': name,
        'description': description,
        'duration': duration,
        'thumbUrl': thumbUrl,
        'workOutUrl': workoutUrl,
        'docNumber': docNumber + 1,
      },
    ).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EndIntro(),
        ),
      ),
    );
  }
}
