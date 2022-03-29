import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.24), BlendMode.darken),
                  ),
                  ),
        ),
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100.h,
                ),
               
                heightSizedBox(),
                Text(
                  "Join Us!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                       Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.42),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Full Name',
                            prefixIcon: Icon(Icons.person),
                            // suffixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                      heightSizedBox(),
                       Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.42),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Mobile Number',
                            prefixIcon: Icon(Icons.mobile_friendly),
                            // suffixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                      heightSizedBox(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.42),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            // suffixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                      heightSizedBox(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.42),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration( 
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Confirm Password',
                            prefixIcon: Icon(Icons.lock),
                            // suffixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     TextButton(
                      //       onPressed: () {},
                      //       child: Text(
                      //         'Forgot Password ?',
                      //         style:
                      //             TextStyle(color: Colors.white, fontSize: 15),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h,),
                ElevatedButton(
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>App()));
                  },
                  child: Text(
                    'Sign Up',
                    // style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF00A6F6),
                      
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
                  fixedSize: Size(300.w, 45.h)
                  ),
                ),
                SizedBox(
                  height: 150.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account? ',
                    style: TextStyle(
                      color: Colors.white70,
                        fontSize: 18
                      ),),
                    GestureDetector(
                      child: Text('Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                      ),
                      onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginScreen()));
                      },
                    ),
                    Text(' here',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      ),
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
