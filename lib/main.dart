import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/constcolor.dart';
import 'package:yarn_modified/screens/splash_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'const/const.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPref.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
          child: CircularProgressIndicator(
        color: Colors.black,
        strokeWidth: 3,
      )),
      overlayColor: Colors.grey.withOpacity(0.1),
      overlayOpacity: 0.2,
      child: GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child!,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.17),
          );
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            cardTheme: CardTheme(
                elevation: 2.5,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: defaultCardRadius)),
            backgroundColor: MyTheme.scaffoldColor,
            appBarTheme: AppBarTheme(color: kthemecolor),
            primaryColor: kthemecolor),
        title: 'Textile Diary',
        home: SplashScreen(),
      ),
    );
  }
}
