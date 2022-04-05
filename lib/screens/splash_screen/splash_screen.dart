import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/bottom_navigation/navigation.dart';
import 'package:trip_calicut/main.dart';
import 'package:trip_calicut/screens/home/homescreen.dart';
import 'package:trip_calicut/screens/login_screen/login_screen.dart';
import 'package:trip_calicut/screens/onboarding/onboarding.dart';
import 'package:trip_calicut/screens/singn_Up/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkFirst();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash background.png'),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Image.asset(
              'assets/images/trifs_logo.png',
              height: 25.h,
              width: 25.w,
            ),
          )
        ],
      ),
    );
  }

  Future<void> gotoBoarding() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }

  Future<void> checkFirst() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    final _finishBoarding = _sharedPreferences.getBool(status);
    if (_finishBoarding == null || !_finishBoarding) {
      gotoBoarding();
    } else {
      await Future.delayed(const Duration(seconds: 1));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => LoginScreen()));
    }
  }
}
