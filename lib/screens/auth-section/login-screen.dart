import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:yarn_modified/screens/auth-section/sign-up-screen.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../widgets/common_fields.dart';
import '../root-app.dart';
import 'forgot-password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final tenDigitsOnly = new RegExp(r'^\d{0,10}$');
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  bool validateRegexExpression(String pass) {
    // String passwordController.text = pass.trim();

    if (pass_valid.hasMatch(passwordController.text)) {
      return true;
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   duration: Duration(seconds: 3),
      //   animation: animation,
      //   backgroundColor: Colors.white,
      //   behavior: SnackBarBehavior.floating,
      //   padding: const EdgeInsets.all(10),
      //   margin: EdgeInsets.only(bottom: 50,left: 20,right: 20),
      //   dismissDirection: DismissDirection.none,
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10)),
      //   content: Text('Password Must Have Minimum Eight Characters, At Least One Uppercase Letter, One Lowercase Letter, One Number And One Special Character.',style: TextStyle(color: Colors.black,fontSize: 15),),
      // ));
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          messagePadding: EdgeInsets.symmetric(vertical: 4,horizontal: 18),
          backgroundColor: Colors.white,
          maxLines: 7,
          icon: Icon(Icons.info_outline_rounded,
              color: Colors.red.withOpacity(0.3), size: 75),
          message:
          "Password Must Have Minimum Eight Characters, At Least One Uppercase Letter, One Lowercase Letter, One Number And One Special Character.",
          textStyle: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w500),
        ),
      );
      return false;
    }
  }

  bool passwordVisible = false;
  bool isLoading = false;

  bool validateMobile = false;
  bool validatePassword = false;

  bool validatePasswordWithDigits = false;
  bool validateMobileWithDigits = false;

  Animation<double>? animation;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;

    controller = AnimationController(
      duration: const Duration(seconds: 0),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeOutSine)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller!.reverse();
        }
      });
  }

  @override
  void dispose() {
    controller!.dispose();
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  moveToHome(BuildContext context) async {
    if (validateMobile == false &&
        validatePassword == false &&
        validatePasswordWithDigits == false &&
        validateMobileWithDigits == false
        // && validateRegexExpression(passwordController.toString()) == true
        ) {
      setState(() {
        isLoading = true;
      });
      Timer(Duration(seconds: 5), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RootApp()));
        FlutterToast.showCustomToast( "Login Success");
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool? exitApp = await  showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              "Exit",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            content: Text(
              "Are you sure you would like exit the application ?",
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
                    exit(0);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )),
            ],
          );
        });
    return exitApp ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WillPopScope(
          onWillPop: () => _onBackButtonPressed(context),
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: MyTheme.scaffoldColor,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                          color: MyTheme.appBarColor,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.white.withOpacity(0.75),
                          //     spreadRadius: 100,
                          //     blurRadius: 200
                          //   )
                          // ],
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                // Colors.transparent.withOpacity(0.05),
                                // Colors.transparent.withOpacity(0.05),
                                Color(0xff1EAFDF),
                                Color(0xff1EAFDF),
                                Color(0xff107698),
                                Color(0xff107698),
                                Color(0xff107698),
                                Color(0xff107698),
                              ]
                          )
                      ),
                    ),
                    ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(height: 25),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: 125,
                                    width: 150,
                                    child: Image.asset("images/RR_Textiles-r.png"))),
                            Center(
                              child: Text(
                                'LOGIN',
                                textScaleFactor: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: MyTheme.scaffoldColor),
                              ),
                            ),
                            SizedBox(height: 25),
                            Card(
                              color: Colors.white,
                              elevation: 10,
                              margin: EdgeInsets.only(left: 20,right: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              // decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.all(Radius.circular(20))
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CommonMobileTextField(
                                        controller: mobileController,
                                        labelText: "Mobile Number",
                                        hintText: "Enter Mobile Number"),
                                    validateMobile
                                        ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0, left: 5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          validateMobile
                                              ? "Mobile Number Required !!!"
                                              : "",
                                          textScaleFactor: 1,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    )
                                        : SizedBox(),
                                    validateMobileWithDigits
                                        ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0, left: 5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          validateMobileWithDigits
                                              ? "Enter Valid 10 Digit Mobile Number !!!"
                                              : "",
                                          textScaleFactor: 1,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    )
                                        : SizedBox(),
                                    SizedBox(height: 20),
                                    Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text(
                                        'Password',
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: MyTheme.appBarColor),
                                      ),
                                    ),
                                    SizedBox(height: 2,),
                                    SizedBox(
                                      child: TextFormField(
                                        autocorrect: false,
                                        textAlign: TextAlign.start,
                                        cursorColor: Colors.black,
                                        textInputAction: TextInputAction.done,
                                        controller: passwordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: passwordVisible,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                          MediaQuery.of(context).textScaleFactor *
                                              15,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Enter Password',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: MediaQuery.of(context)
                                                .textScaleFactor *
                                                13,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 15),
                                          suffixIcon: IconButton(
                                            splashRadius: 0.1,
                                            icon: Icon(
                                              passwordVisible
                                                  ? Icons.visibility_off_rounded
                                                  : Icons.visibility_rounded,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              setState(
                                                    () {
                                                  passwordVisible = !passwordVisible;
                                                },
                                              );
                                            },
                                          ),
                                          disabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 0.25),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.blue.withOpacity(0.5),width: 1),
                                          ),
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    validatePassword
                                        ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7, left: 5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          validatePassword
                                              ? "Password Required !!!"
                                              : "",
                                          textScaleFactor: 1,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    )
                                        : SizedBox(),
                                    validatePasswordWithDigits
                                        ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7, left: 5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          validatePasswordWithDigits
                                              ? "Password Must Contain Atleast 8 Digits !!!"
                                              : "",
                                          textScaleFactor: 1,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    )
                                        : SizedBox(),
                                    SizedBox(height: 50),
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   if (mobileController.text.isEmpty) {
                                            //     validateMobile = true;
                                            //   } else {
                                            //     validateMobile = false;
                                            //   }
                                            //   if (mobileController.text.isNotEmpty &&
                                            //       mobileController.text.length < 10) {
                                            //     validateMobileWithDigits = true;
                                            //   } else {
                                            //     validateMobileWithDigits = false;
                                            //   }
                                            //   if (passwordController.text.isEmpty) {
                                            //     validatePassword = true;
                                            //   } else {
                                            //     validatePassword = false;
                                            //     // validateRegexExpression(passwordController.text);
                                            //   }
                                            //   if (passwordController
                                            //       .text.isNotEmpty &&
                                            //       passwordController.text.length <
                                            //           8) {
                                            //     validatePasswordWithDigits = true;
                                            //   } else {
                                            //     validatePasswordWithDigits = false;
                                            //   }
                                            // });
                                            // moveToHome(context);
                                            Navigator.push(
                                                context, MaterialPageRoute(builder: (context) => RootApp()));
                                            FlutterToast.showCustomToast("Login Success");
                                          },
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8))),
                                              backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black.withOpacity(0.75))),
                                          child: Text('LOGIN')),
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              constraints: BoxConstraints(),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                                  },
                                  style: ButtonStyle(
                                      overlayColor:
                                      MaterialStateColor.resolveWith(
                                              (states) => Colors.black
                                              .withOpacity(0.2)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10))),
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.transparent),
                                      foregroundColor:
                                      MaterialStateProperty.all(
                                          Colors.black)),
                                  child: Text(
                                    'Forgot Password ?',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Don't have an account ?",
                                    style: TextStyle(color: Colors.black)),
                                SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen()));
                                    },
                                    style: ButtonStyle(
                                        overlayColor:
                                        MaterialStateColor.resolveWith(
                                                (states) => Colors.black
                                                .withOpacity(0.2)),
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                        backgroundColor: MaterialStateProperty.all(
                                            Colors.transparent
                                                .withOpacity(0)),
                                        foregroundColor:
                                        MaterialStateProperty.all(
                                            Colors.transparent)),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(1),
                                          decoration:
                                          TextDecoration.underline),
                                    )),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        isLoading
            ? Container(
                color: Colors.white.withOpacity(0.25),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 3,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

//======================Rough=========================

// Stack(
//   children: [
//     Positioned.fill(
//         child: Image(
//       image: AssetImage('images/login-yarn.png'),
//       fit: BoxFit.fill,
//     )),
//     Positioned.fill(
//       child: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [
//         Colors.black.withOpacity(0.65),
//         Colors.black.withOpacity(0.65),
//       ], end: Alignment.topCenter, begin: Alignment.bottomCenter))),
//     ),
//   ],
// ),
