import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/screens/splash_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(GlobalLoaderOverlay(
    useDefaultLoading: false,
    overlayWidget: Center(
      child: CircularProgressIndicator()
    ),
overlayColor: Colors.grey.withOpacity(0.5),
    overlayOpacity: 0.2,

    child: GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.17),
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scrollbarTheme: ScrollbarThemeData(
        interactive: true,
        thumbVisibility: MaterialStateProperty.all(false),
        radius: const Radius.circular(10),
        thumbColor: MaterialStateProperty.all(Colors.black.withOpacity(0.25)),
        thickness: MaterialStateProperty.all(7.5),
      )),
      title: 'RR Textiles',
      home: SplashScreen(),
    ),
  ));
}
