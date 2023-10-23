import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../const/const.dart';
import '../../const/themes.dart';
import '../../widgets/common_fields.dart';
import 'login-screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> FormKey = GlobalKey<FormState>();
  final tenDigitsOnly = new RegExp(r'^\d{0,10}$');
  bool passwordVisible1 = false;
  bool passwordVisible2 = false;
  bool checkboxValue = false;
  bool isLoading = false;

  bool validateMobile = false;
  bool validatePassword = false;
  bool validateConfirmPassword = false;
  bool validateName = false;
  bool validateEmail = false;

  bool validatePasswordWithDigits = false;
  bool validateConfirmPasswordWithDigits = false;
  bool validateMobileWithDigits = false;
  bool validateEmailWithDigits = false;
  final RegExp gmailRegex = RegExp(r'[a-z \d _\-\.]+@[a-z]{5}\.[a-z]{2,3}$');
  //
  // final RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])+(?=.*?[a-z])+(?=.*?[0-9])+(?=.*?[!@#\$&*~])$');
  // final RegExp passwordRegex =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  final RegExp passwordValidationExp =
      RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  bool validateRegexExpression(String pass) {
    // String passwordController.text = pass.trim();

    if (passwordValidationExp.hasMatch(passwordController.text)) {
      print("OK");
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

  Animation<double>? animation;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    passwordVisible1 = true;
    passwordVisible2 = true;

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeOutQuart)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller!.reverse();
        }
      });
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  moveToLogin(BuildContext context) async {
    if (validateMobile == false &&
        validatePassword == false &&
        validatePasswordWithDigits == false &&
        validateMobileWithDigits == false &&
        validateName == false &&
        validateEmail == false &&
        validateEmailWithDigits == false &&
        validateConfirmPassword == false &&
        validateConfirmPasswordWithDigits == false &&
        checkboxValue == true
        // && passwordValidationExp.hasMatch(passwordController.text) == true
        // &&
        // validateRegexExpression(passwordController.toString()) == true
    ) {
      setState(() {
        isLoading = true;
      });
      Timer(Duration(milliseconds: 2500), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        FlutterToast.showCustomToast("Registration Success\nPlease Sign In To Go Forward");
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                                'CREATE ACCOUNT',
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
                                  children: [
                                    CommonTextField(
                                      controller: nameController,
                                      labelText: 'Name',
                                      keyboardType: TextInputType.text,
                                      hintText: 'Enter Your Full Name',
                                      inputFormatters: FilteringTextInputFormatter.deny(
                                          RegExp(r'[/\\-_]')),
                                    ),
                                    validateName
                                        ? Padding(
                                      padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          validateName
                                              ? "Full Name Is Required !!!"
                                              : "",
                                          textScaleFactor: 1,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    )
                                        : SizedBox(),
                                    SizedBox(height: 25),
                                    CommonMobileTextField(
                                        controller: mobileController,
                                        labelText: "Mobile Number",
                                        hintText: "Enter Mobile Number"),
                                    validateMobile
                                        ? Padding(
                                      padding:
                                      const EdgeInsets.only(top: 5, left: 5),
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
                                      padding:
                                      const EdgeInsets.only(top: 5, left: 5),
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
                                    CommonTextField(
                                      controller: emailController,
                                      labelText: 'Email',
                                      keyboardType: TextInputType.emailAddress,
                                      hintText: 'Enter Your Email Address',
                                      inputFormatters: FilteringTextInputFormatter.deny(
                                          RegExp(r'[/\\]')),
                                    ),
                                    validateEmail
                                        ? Padding(
                                      padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          validateEmail
                                              ? "Email Address Required !!!"
                                              : "",
                                          textScaleFactor: 1,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    )
                                        : SizedBox(),
                                    validateEmailWithDigits
                                        ? Padding(
                                      padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          validateEmailWithDigits
                                              ? "Enter Valid Email Address !!!"
                                              : "",
                                          textScaleFactor: 1,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    )
                                        : SizedBox(),
                                    SizedBox(height: 25),
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
                                        textInputAction: TextInputAction.next,
                                        controller: passwordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: passwordVisible1,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                          MediaQuery.of(context).textScaleFactor * 15,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Enter Password',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize:
                                            MediaQuery.of(context).textScaleFactor *
                                                13,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 15),
                                          suffixIcon: IconButton(
                                            splashRadius: 0.1,
                                            icon: Icon(
                                              passwordVisible1
                                                  ? Icons.visibility_off_rounded
                                                  : Icons.visibility_rounded,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              setState(
                                                    () {
                                                  passwordVisible1 = !passwordVisible1;
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
                                      padding:
                                      const EdgeInsets.only(top: 5, left: 5),
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
                                      padding:
                                      const EdgeInsets.only(top: 5, left: 5),
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
                                    SizedBox(height: 25),
                                    Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text(
                                        'Confirm Password',
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
                                        controller: confirmPasswordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: passwordVisible2,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                          MediaQuery.of(context).textScaleFactor * 15,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Enter Confirm Password',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize:
                                            MediaQuery.of(context).textScaleFactor *
                                                13,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 15),
                                          suffixIcon: IconButton(
                                            splashRadius: 0.1,
                                            icon: Icon(
                                              passwordVisible2
                                                  ? Icons.visibility_off_rounded
                                                  : Icons.visibility_rounded,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              setState(
                                                    () {
                                                  passwordVisible2 = !passwordVisible2;
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
                                    validateConfirmPassword
                                        ? Padding(
                                      padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          validateConfirmPassword
                                              ? "Confirm Password Required !!!"
                                              : "",
                                          textScaleFactor: 1,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    )
                                        : SizedBox(),
                                    validateConfirmPasswordWithDigits
                                        ? Padding(
                                      padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          validateConfirmPasswordWithDigits
                                              ? "Password And Confirm Password Not Same !!!"
                                              : "",
                                          textScaleFactor: 1,
                                          style:
                                          TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    )
                                        : SizedBox(),
                                    Padding(padding: EdgeInsets.only(top: 30)),
                                    // ListTile(
                                    //   minLeadingWidth: -25.5,
                                    //   minVerticalPadding: 0,
                                    //   // minLeadingWidth: 0,
                                    //   contentPadding: EdgeInsets.zero,
                                    //   leading: Checkbox(
                                    //     shape: RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.circular(10)),
                                    //     checkColor: Colors.white,
                                    //     activeColor: Colors.blueAccent,
                                    //     side: BorderSide(color: Colors.black),
                                    //     value: checkboxValue,
                                    //     onChanged: (value) {
                                    //       setState(() => checkboxValue = value!);
                                    //     },
                                    //   ),
                                    //   title: RichText(
                                    //     textScaleFactor: 1.2,
                                    //     text: TextSpan(
                                    //         text: 'I agree to the ',
                                    //         style: TextStyle(
                                    //             color: MyTheme.appBarColor),
                                    //         children: [
                                    //           TextSpan(
                                    //             text: 'terms',
                                    //             style: TextStyle(
                                    //                 color: MyTheme.appBarColor,
                                    //                 decoration:
                                    //                 TextDecoration.underline,
                                    //                 fontWeight: FontWeight.bold),
                                    //           ),
                                    //           TextSpan(
                                    //             text: ' and ',
                                    //             style: TextStyle(
                                    //                 color: MyTheme.appBarColor),
                                    //           ),
                                    //           TextSpan(
                                    //             text: 'conditions.',
                                    //             style: TextStyle(
                                    //                 color: MyTheme.appBarColor,
                                    //                 decoration:
                                    //                 TextDecoration.underline,
                                    //                 fontWeight: FontWeight.bold),
                                    //           )
                                    //         ]),
                                    //   ),
                                    // ),
                                    CheckboxListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      checkboxShape: CircleBorder(),
                                      checkColor: Colors.white,
                                      activeColor: Colors.blueAccent,
                                      side: BorderSide(color: Colors.black),
                                      contentPadding: EdgeInsets.all(0),
                                      value: checkboxValue,
                                      onChanged: (value) {
                                        setState(() => checkboxValue = value!);
                                      },
                                      title: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: RichText(
                                          textScaleFactor: 1.2,
                                          text: TextSpan(
                                              text: 'I agree to the ',
                                              style: TextStyle(
                                                  color: MyTheme.appBarColor),
                                              children: [
                                                TextSpan(
                                                  text: 'terms',
                                                  style: TextStyle(
                                                      color: MyTheme.appBarColor,
                                                      decoration:
                                                      TextDecoration.underline,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                TextSpan(
                                                  text: ' and ',
                                                  style: TextStyle(
                                                      color: MyTheme.appBarColor),
                                                ),
                                                TextSpan(
                                                  text: 'conditions.',
                                                  style: TextStyle(
                                                      color: MyTheme.appBarColor,
                                                      decoration:
                                                      TextDecoration.underline,
                                                      fontWeight: FontWeight.bold),
                                                )
                                              ]),
                                        ),
                                      ),
                                      controlAffinity: ListTileControlAffinity.leading,
                                    ),
                                    checkboxValue
                                        ? SizedBox()
                                        : Align(
                                      alignment: AlignmentDirectional.centerStart,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Text(
                                            'Please accept terms and conditions.',
                                            textScaleFactor: 1,
                                            style: TextStyle(color: Colors.red)),
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    Container(
                                      height: 40,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            // setState(() {
                                            //   if (nameController.text.isEmpty) {
                                            //     validateName = true;
                                            //   } else {
                                            //     validateName = false;
                                            //   }
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
                                            //   if (emailController.text.isEmpty) {
                                            //     validateEmail = true;
                                            //   } else {
                                            //     validateEmail = false;
                                            //   }
                                            //   if (emailController.text.isNotEmpty) {
                                            //     if (gmailRegex
                                            //         .hasMatch(emailController.text)) {
                                            //       validateEmailWithDigits = false;
                                            //     } else {
                                            //       validateEmailWithDigits = true;
                                            //     }
                                            //   }
                                            //   if (passwordController.text.isEmpty) {
                                            //     validatePassword = true;
                                            //   } else {
                                            //     validatePassword = false;
                                            //     // validateRegexExpression(passwordController.text);
                                            //   }
                                            //   if (passwordController.text.isNotEmpty) {
                                            //     if (passwordController.text.length < 8) {
                                            //       validatePasswordWithDigits = true;
                                            //     } else {
                                            //       validatePasswordWithDigits = false;
                                            //     }
                                            //   }
                                            //   if (confirmPasswordController
                                            //       .text.isEmpty) {
                                            //     validateConfirmPassword = true;
                                            //   } else {
                                            //     validateConfirmPassword = false;
                                            //   }
                                            //   if (confirmPasswordController
                                            //       .text.isNotEmpty &&
                                            //       confirmPasswordController.text !=
                                            //           passwordController.text) {
                                            //     validateConfirmPasswordWithDigits = true;
                                            //   } else {
                                            //     validateConfirmPasswordWithDigits = false;
                                            //   }
                                            // });
                                            // moveToLogin(context);
                                            Navigator.push(
                                                context, MaterialPageRoute(builder: (context) => LoginScreen()));
                                            FlutterToast.showCustomToast("Registration Success\nPlease Sign In To Go Forward");
                                          },
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8))),
                                              backgroundColor: MaterialStateProperty.all(
                                                  Colors.black.withOpacity(0.75))),
                                          child: Text('SIGN UP')),
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Already have an account ?",textScaleFactor: 1.25,
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
                                                    LoginScreen()));
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
                                          backgroundColor: MaterialStateProperty.all(
                                              Colors.transparent.withOpacity(0)),
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent)),
                                      child: Text(
                                        'Sign In',textScaleFactor: 1.25,
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(1),
                                            decoration: TextDecoration.underline),
                                      )),
                                ],
                              ),
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
