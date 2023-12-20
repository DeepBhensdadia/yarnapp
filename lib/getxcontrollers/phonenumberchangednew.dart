import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/const/const.dart';
import 'package:yarn_modified/getxcontrollers/authcontroller.dart';
import 'package:yarn_modified/getxcontrollers/updateuserdetails.dart';
import 'package:yarn_modified/screens/auth-section/sign-up-screen.dart';
import 'package:yarn_modified/screens/auth-section/verifyotpscreen.dart';
import 'package:yarn_modified/screens/profile-section/account-section/newmobilenumber.dart';
import 'package:yarn_modified/screens/profile-section/account-section/verifyotpforold.dart';
import 'package:yarn_modified/screens/root-app.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';

class PhoneNumberChangenew extends GetxController {
  String verificationid = "";

  Future<void> sendOTP(String phoneNumber) async {
    Get.context!.loaderOverlay.show();

    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: "+91 $phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) {
        print(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.context!.loaderOverlay.hide();
        FlutterToast.showCustomToast(e.message ?? "");
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.context!.loaderOverlay.hide();
        verificationid = verificationId;
        FlutterToast.showCustomToast("OTP sent Successfully");
        Get.to(VerifyOtpOld(
          phonenumber:
          saveUser()?.mobileNumber ?? '',
          oldnumebr: false,
        ));
        print('Verification ID: $verificationId');
        print('Verification ID: $resendToken');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Get.context!.loaderOverlay.hide();
        log(verificationId);
      },
    );
  }
  Future<void> ResendOTP(String phoneNumber) async {
    Get.context!.loaderOverlay.show();

    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: "+91 $phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) {
        print(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.context!.loaderOverlay.hide();
        FlutterToast.showCustomToast(e.message ?? "");
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.context!.loaderOverlay.hide();
        verificationid = verificationId;
        FlutterToast.showCustomToast("OTP sent Successfully");
        // Get.to(VerifyOtpOld(
        //   phonenumber:
        //   saveUser()?.mobileNumber ?? '',
        //   oldnumebr: false,
        // ));
        print('Verification ID: $verificationId');
        print('Verification ID: $resendToken');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Get.context!.loaderOverlay.hide();
        log(verificationId);
      },
    );
  }

  Future<void> verifyOTP({required String smsCode,required String phonenumber}) async {
    Get.context!.loaderOverlay.show();

    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationid,
        smsCode: smsCode,
      );

      UserCredential userCredential =
      await auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        Get.context!.loaderOverlay.hide();
        FlutterToast.showCustomToast('OTP verified');
        Get.put(UpdateUserController()).updatemobilenumberpost(
            mobilenumber: phonenumber);
      } else {
        Get.context!.loaderOverlay.hide();
        FlutterToast.showCustomToast('OTP verification failed');
      }
    } catch (e) {
      Get.context!.loaderOverlay.hide();
      FlutterToast.showCustomToast('OTP verification failed');
      print('Error verifying OTP: $e');
      // Handle error while verifying OTP
    }
  }
}
