import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/main.dart';
import 'package:test2/screen1.dart';
import 'package:test2/screen2.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    goToLogin();
    checkUserCred();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        
        child:
        
         ClipOval(child: Image.asset('assets\\images\\Screenshot 2023-05-12 191155.png',height: 150,)),
        
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> goToLogin() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => LoginPage()));
  }

   Future<void> checkUserCred() async{
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(saveKeyValue);
    if(_userLoggedIn == null || _userLoggedIn == false){
      goToLogin();
    }
    else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
    }
  }
}  