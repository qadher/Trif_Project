import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/bottom_navigation/navigation.dart';
import 'package:trip_calicut/screens/login_screen/login_screen.dart';
import 'package:trip_calicut/widgets.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sign up.png'),
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
                    height: 10.h,
                  ),
                  Text(
                    "Join Us!",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 6.h,
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
                              hintText: 'Full Name',
                              prefixIcon: Icon(Icons.person),
                              // suffixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.42),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 15),
                              hintText: 'Mobile Number',
                              prefixIcon: Icon(Icons.mobile_friendly),
                              // suffixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.42),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: TextField(
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
                              hintText: 'Confirm Password',
                              prefixIcon: Icon(Icons.lock),
                              // suffixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (ctx) => App()));
                            },
                            child: Text(
                              'Sign Up',
                              // style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF00A6F6),
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              // fixedSize: Size(300.w, 45.h)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5.h,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    GestureDetector(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => LoginScreen()));
                      },
                    ),
                    Text(
                      ' here',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
