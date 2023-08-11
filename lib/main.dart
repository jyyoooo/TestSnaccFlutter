import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:test2/screen1.dart';
import 'package:test2/splash.dart';

late SharedPreferences sharedpref;

const saveKeyValue = 'UserLogin';

main() async {
  runApp(JyoApp());
}

class JyoApp extends StatelessWidget {
  const JyoApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Snacc Login',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: SplashPage(),

      // routes: {
      //   'screen1':(ctx){return ScreenOne();},
      //   'screen2':(ctx){return ScreenTwo();},
      // },
    );
  }

 
}
