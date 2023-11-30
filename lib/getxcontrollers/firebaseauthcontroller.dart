import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/getxcontrollers/authcontroller.dart';
import 'package:yarn_modified/screens/auth-section/sign-up-screen.dart';
import 'package:yarn_modified/screens/auth-section/verifyotpscreen.dart';
import 'package:yarn_modified/screens/root-app.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';

class FirebaseAuthContrller extends GetxController {
  String verificationid = "";
  AuthController authController = Get.put(AuthController());
  Future<void> sendOTP(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: "+91 $phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) {
        print(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.context!.loaderOverlay.hide();
        FlutterToast.showCustomToast("Something Wrong Please Try Again");
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.context!.loaderOverlay.hide();
        verificationid = verificationId;
        FlutterToast.showCustomToast("OTP sent Successfully");
        Get.to(VerifyOtpScreen(phonenumber: phoneNumber));
        print('Verification ID: $verificationId');
        print('Verification ID: $resendToken');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Get.context!.loaderOverlay.hide();
        log(verificationId);
      },
    );
  }

  Future<void> verifyOTP(String smsCode, widget) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationid,
        smsCode: smsCode,
      );

      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        FlutterToast.showCustomToast('OTP verified');
        if (widget.register != true) {
          Get.context!.loaderOverlay.show();
          await getlogindetails(keyword: widget.phonenumber).then((value) {
            Get.context!.loaderOverlay.hide();

            if (value.success != false) {
              SharedPref.save(
                  value: jsonEncode(value.toJson()),
                  prefKey: PrefKey.loginDetails);
              Get.offAll(RootApp());
              FlutterToast.showCustomToast(value.message ?? "");
            } else {
              Get.offAll(SignUpScreen(phonenumber: widget.phonenumber));
            }

            print(value);
          }).onError((error, stackTrace) {
            Get.context!.loaderOverlay.hide();
            print("error..$error");
          });
        } else {
          authController.registerlogin();
        }
      } else {
        FlutterToast.showCustomToast('OTP verification failed');
      }
    } catch (e) {
      print('Error verifying OTP: $e');
      // Handle error while verifying OTP
    }
  }
}
