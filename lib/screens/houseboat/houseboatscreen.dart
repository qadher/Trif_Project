import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/components/packagecard.dart';
import 'package:trip_calicut/screens/houseboat/components/packagecard_houseboat.dart';
import 'package:trip_calicut/screens/home/components/carousel.dart';

import '../home/components/titletext.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../widgets.dart';

class HouseBoatScreen extends StatelessWidget {
  const HouseBoatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf5fb),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'HouseBoat',
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
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
                  child: TitleText(text: 'Recomended Packages'),
                ),
                heightSizedBox(),

                // ListView.separated(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: 10,
                //   separatorBuilder: (context, index) => SizedBox(
                //     height: 10,
                //   ),
                //   itemBuilder: (context, index) {
                //     return PackageCardHouseBoat();
                //   } ,
                // ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        PackageCardHouseBoat(),
                        widthSizedBox(),
                        PackageCardHouseBoat(),
                        widthSizedBox(),
                        PackageCardHouseBoat(),
                        widthSizedBox(),
                        PackageCardHouseBoat(),
                        widthSizedBox(),
                        PackageCardHouseBoat(),
                        widthSizedBox(),
                        PackageCardHouseBoat(),
                        widthSizedBox(),
                        PackageCardHouseBoat(),
                        widthSizedBox(),
                        PackageCardHouseBoat(),
                        widthSizedBox(),
                        PackageCardHouseBoat(),
                      ],
                    ),
                  ),
                ),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Promoted Agencies'),
                ),
                heightSizedBox(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                      ],
                    ),
                  ),
                ),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Discover HouseBoats'),
                ),
                heightSizedBox(),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemBuilder: (context, index) => PackageCard(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
