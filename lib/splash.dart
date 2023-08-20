import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/main.dart';
import 'package:test2/login_page.dart';
import 'package:test2/landing_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isLoading = false;
          goToLogin();
        }
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.scale(
          scale: _scaleAnimation.value,
          child: ClipOval(
            child: Image.asset(
              'assets/images/Screenshot 2023-05-12 191155.png',
              height: 150,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> goToLogin() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => LoginPage()));
  }

  Future<void> checkUserCred() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(saveKeyValue);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      goToLogin();
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => LandingPage()), (route) => false);
    }
  }
}
