import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../const/const.dart';
import '../../auth-section/forgot-password.dart';
import '../../auth-section/login-screen.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  File? _image;
  final _picker = ImagePicker();
  bool isLoading = false;

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      setState(() {});
    } else {
      print('No Image Selected');
    }

    // setState(() {
    //   _image = pickedFile as File;
    // });
  }

  Future<bool> _onLogoutButtonPressed(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              "LOGOUT",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            content: Text(
              "Are you sure you would like to log out of the application ?",
              style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
            ),
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                      backgroundColor: Colors.white.withOpacity(0.9)),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                      backgroundColor: Colors.white.withOpacity(0.9)),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    Timer(Duration(milliseconds: 2500), () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      FlutterToast.showCustomToast("Logout");
                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
            ],
          );
        });
    return false;
  }
  Future<bool> _onDeleteAccountButtonPressed(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              "DELETE ACCOUNT",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            content:  RichText(
              textScaleFactor: 1.3,
              text: TextSpan(
                  text: 'Are you sure you want to ',
                  style: TextStyle(
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'delete',
                      style: TextStyle(
                          color: Colors.red,
                          decoration:
                          TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' your account ',
                      style: TextStyle(
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: 'forever.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
            // Text(
            //   "Are you sure you would like to Delete Your Account ?",
            //   style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
            // ),
            actions: <Widget>[
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                      backgroundColor: Colors.white.withOpacity(0.9)),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                      backgroundColor: Colors.red.withOpacity(0.9)),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    Timer(Duration(milliseconds: 2500), () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      Fluttertoast.showToast(
                          msg: "Account Deleted Successfully",
                          fontSize: 15,
                          backgroundColor: Colors.white,
                          textColor: Colors.red
                      );
                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
            ],
          );
        });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.blueGrey.withOpacity(0.75),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
            backgroundColor: Colors.transparent,title: Text('My Account',textScaleFactor: 1,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),centerTitle: true,),
          body: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: 190, maxHeight: 190),
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10),
                            child: Material(
                                elevation: 10,
                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 3, color: Colors.black)),
                                clipBehavior: Clip.antiAlias,
                                color: Colors.transparent,
                                child: _image == null
                                    ? Ink.image(
                                  image: AssetImage(
                                      'images/avatar.png'
                                  ),
                                  fit: BoxFit.contain,
                                  width: 220,
                                  height: 220,
                                  child: InkWell(
                                    radius: 0,
                                    onTap: () {},
                                  ),
                                )
                                    : Ink.image(
                                  image: FileImage(File(_image!.path).absolute),
                                  fit: BoxFit.contain,
                                  width: 220,
                                  height: 220,
                                  child: InkWell(
                                    radius: 0,
                                    onTap: () {},
                                  ),
                                )
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: -40,
                          left: 70,
                          child: Tooltip(
                            message: 'Pick Image',
                            child: RawMaterialButton(
                              onPressed: () {
                                getImage();
                              },
                              elevation: 2,
                              fillColor: Colors.white,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey,
                              ),
                              padding: EdgeInsets.all(7.5),
                              shape: CircleBorder(
                                  side: BorderSide(
                                      color: Colors.grey)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50,),

                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder( //<-- SEE HERE
                      side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minLeadingWidth: 10,
                    leading: Icon(Icons.lock_reset_rounded),
                    title: Text("Change Password"),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder( //<-- SEE HERE
                      side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minLeadingWidth: 10,
                    leading: Icon(Icons.delete_forever_rounded),
                    title: Text("Delete Account"),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () {
                      _onDeleteAccountButtonPressed(context);
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder( //<-- SEE HERE
                      side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minLeadingWidth: 10,
                    leading: Icon(Icons.logout_outlined),
                    title: Text("Logout"),
                    trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    onTap: () {
                      _onLogoutButtonPressed(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        isLoading ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.5,),
            CircularProgressIndicator(color: Colors.black,strokeWidth: 4,),
          ],
        ) : Container(),
      ],
    );
  }
}
