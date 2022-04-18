import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/screens/blind_spot/components/blindSpot_card_list.dart';
import 'package:trip_calicut/screens/camping/Components/camppackagecard.dart';
import 'package:trip_calicut/screens/home/components/carousel.dart';
import 'package:trip_calicut/screens/travel/componenets/travelpackagecard.dart';

import '../home/components/packagecard.dart';
import '../home/components/titletext.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../tours/components/categoryscrolllist.dart';
import '../widgets.dart';

class BlindSpotInnerScreen extends StatelessWidget {
  const BlindSpotInnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf5fb),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Blind Spot',
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // heightSizedBox(),
                  // Container(
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {},
                  //         child: Container(
                  //           width: 25.w,
                  //           height: 13.h,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(25),
                  //             image: DecorationImage(
                  //               image: AssetImage(
                  //                 'assets/images/imageone.jpg',
                  //               ),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  heightSizedBox(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 25.w,
                          height: 13.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/addimage.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
