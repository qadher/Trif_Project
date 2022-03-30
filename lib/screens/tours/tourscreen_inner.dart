import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/jobs/components/FixedBottomSwitch.dart';
import 'package:trip_calicut/screens/tours/components/AppBarWidget.dart';
import 'package:trip_calicut/widgets.dart';

class TourInnerScreen extends StatelessWidget {
  const TourInnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.jpg'),
                          fit: BoxFit.cover),
                      // borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  heightSizedBox(),
                  SizedBox(
                    height: 80.h,
                  ),
                ],
              ),
            ),
            FixedBottomSwitch(),
          ],
        ),
      ),
    );
  }
}
