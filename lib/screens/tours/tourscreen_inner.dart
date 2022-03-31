import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/jobs/components/FixedBottomSwitch.dart';
import 'package:trip_calicut/screens/tours/components/AppBarWidget.dart';
import 'package:trip_calicut/screens/tours/components/fixed_top_navigatio.dart';
import 'package:trip_calicut/widgets.dart';

class TourInnerScreen extends StatelessWidget {
  const TourInnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller;
    return Scaffold(
      // backgroundColor: Color(0xff00A6F6),
      backgroundColor: Color(0xff00A6F6),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Column(
                children: [
                  Container(
                    // height: 2000.h,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 500.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.4),
                                          BlendMode.darken),
                                      image: AssetImage(
                                          'assets/images/background.jpg'),
                                      fit: BoxFit.cover),
                                  color: Colors.black),
                            ),
                            Positioned(
                                bottom: 75.h,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Heritage Villa',
                                            style: TextStyle(
                                                fontSize: 30.w,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            'Athirappilly, Thrissur, Kerala',
                                            style: TextStyle(
                                                fontSize: 16.w,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white70),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.favorite_outline,
                                        size: 30.w,
                                        color: Color.fromARGB(255, 160, 14, 14),
                                      ),
                                    ],
                                  ),
                                )),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60.h,
                                child: Center(
                                  child: Text(
                                    'Price Starts from ₹2000/-',
                                    style: TextStyle(
                                        fontSize: 28.w,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xff00A6F6),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40))),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Color(0xff00A6F6),
                          child: Container(
                            height: 700,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                            ),
                            
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FixedBottomSwitch(),
            FixedTopNavigation(),
          ],
        ),
      ),
    );
  }
}
