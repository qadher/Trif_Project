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

class JobScreen extends StatelessWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Jobs',
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
                Container(
                  height: 140.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: false,
                        viewportFraction: 1),
                    items: imageSlidersBanner,
                  ),
                ),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'District'),
                ),
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
                ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
                              separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                              itemBuilder: (context, index) => JobTile(),
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

