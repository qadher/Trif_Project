import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/home/homescreen.dart';
import 'package:trip_calicut/screens/singn_Up/signup.dart';
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
                  height: 60.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 90.w,
                        height: 90.h,
                        /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset(
                          'assets/images/trifs_logo_login.png',
                        )),
                  ),
                ),
                heightSizedBox(),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 60.h,
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
                            hintText: 'Email Id or Mobile Number',
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
                          obscureText: true,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password ?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                //   padding: EdgeInsets.symmetric(horizontal: 15),
                //   child: TextFormField(
                //     // controller: ,
                //     decoration: InputDecoration(
                //         filled: true,
                //         fillColor: Colors.grey,
                //         prefixIcon: Icon(Icons.person),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(50),
                //         ),
                //         labelText: 'Email Id or Mobile Number',
                //         hintText: 'Enter valid email id as abc@gmail.com'),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 15.0, right: 15.0, top: 15, bottom: 0),
                //   //padding: EdgeInsets.symmetric(horizontal: 15),
                //   child: TextFormField(
                //     obscureText: true,
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(Icons.lock),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(50)),
                //         labelText: 'Password',
                //         hintText: 'Enter secure password'),
                //   ),
                // ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text(
                    'Sign In',
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
                // Container(
                //   height: 50,
                //   width: 250,
                //   decoration: BoxDecoration(
                //       color: Colors.blue,
                //       borderRadius: BorderRadius.circular(20)),
                //   child: TextButton(
                //     onPressed: () {
                //       // Navigator.push(
                //       // context, MaterialPageRoute(builder: (_) => HomePage()));
                //     },
                //     child: Text(
                //       'Login',
                //       style: TextStyle(color: Colors.white, fontSize: 25),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 28.h,
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
                      child: Text('Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                      ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SignUpScreen()));
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
