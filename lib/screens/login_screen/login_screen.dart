import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/bottom_navigation/navigation.dart';
import 'package:trip_calicut/screens/home/homescreen.dart';
import 'package:trip_calicut/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.24), BlendMode.darken),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/trifs_logo_login.png',
                    height: 15.h,
                    width: 25.w,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.42),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 15),
                            hintText: 'Email Id or Mobile Number',
                            prefixIcon: Icon(Icons.person),
                            // suffixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                      // heightSizedBox(),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.42),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 15),
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            // suffixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password ?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 5.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offNamed("/bottomNav");

                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => App()),
                            // );
                          },
                          child: Text(
                            'Sign In',
                            // style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF00A6F6),
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w900),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            // fixedSize: Size(300, 45),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    GestureDetector(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onTap: () {
                        Get.toNamed('/signUp');
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (ctx) => SignUpScreen()));
                      },
                    ),
                    Text(
                      ' here',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      height: 2.h,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
