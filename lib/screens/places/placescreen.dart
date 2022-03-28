import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home/components/carousel.dart';
import '../home/components/titletext.dart';
import '../home/components/topattractions.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../tours/components/districts.dart';
import '../widgets.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Places',
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
                Container(
                  height: 150.h,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    items: imageSliders,
                  ),
                ),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(
                    text: 'Kerala > Districts',
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      //spaceevenly
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            DistrictCard(),
                            DistrictCard(),
                            DistrictCard(),
                            DistrictCard(),
                          ],
                        ),
                        Column(
                          children: [
                            DistrictCard(),
                            DistrictCard(),
                            DistrictCard(),
                            DistrictCard(),
                          ],
                        ),
                        Column(
                          children: [
                            DistrictCard(),
                            DistrictCard(),
                            DistrictCard(),
                            DistrictCard(),
                          ],
                        ),
                        Column(
                          children: [
                            DistrictCard(),
                            DistrictCard(),
                            DistrictCard(),
                            DistrictCard(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                heightSizedBox(),
                
                heightSizedBox(),
                TitleText(text: 'Trending Now'),
                heightSizedBox(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        TopAttractions(),
                        SizedBox(
                          width: 10.w,
                        ),
                        TopAttractions(),
                        SizedBox(
                          width: 10.w,
                        ),
                        TopAttractions(),
                        SizedBox(
                          width: 10.w,
                        ),
                        TopAttractions(),
                        SizedBox(
                          width: 10.w,
                        ),
                        TopAttractions(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
