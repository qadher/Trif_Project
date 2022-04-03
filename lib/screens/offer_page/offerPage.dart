import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/home/components/carousel.dart';
import 'package:trip_calicut/screens/jobs/components/job_tile.dart';

import '../../components/packagecard.dart';
import '../home/components/titletext.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../tours/components/topdestination.dart';
import '../widgets.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Offers',
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // adsBanner(context),
                
                heightSizedBox(),
                
                // heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                      ],
                    ),
                  ),
                ),
                heightSizedBox(),
                // JobTile(),
                // heightSizedBox(),
                // JobTile(),
                // heightSizedBox(),
                // JobTile(),
                // heightSizedBox(),
                // JobTile(),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 10.w),
                   child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 2.h
                        // mainAxisExtent: 100.h,
                      ),
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              height: 120.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/imageone.jpg'),
                                      fit: BoxFit.cover),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)),
                              // child: Center(child: Text('$index')),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(top: 8.h),
                            //   child: Center(
                            //     child: Text(
                            //       'data',
                            //       style: TextStyle(
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w500,
                            //         color: Colors.black87,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        );
                      },
                    ),
                 ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8),
                //   child: TitleText(text: 'Vehicles in Ollur...'),
                // ),
                heightSizedBox(),
                // ListView.separated(
                //   physics: NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   itemCount: 10,
                //   separatorBuilder: (context, index) => SizedBox(
                //     height: 10.h,
                //   ),
                //   itemBuilder: (context, index) => Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 8),
                //     child: PackageCard(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
