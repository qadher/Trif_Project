import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/screens/home/components/packagecard.dart';
import 'package:trip_calicut/screens/houseboat/components/agencycard.dart';
import 'package:trip_calicut/screens/houseboat/components/houseboat_list_card.dart';
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
                  height: 25.h,
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
                  child: TitleText(text: 'Recomended Packages'),
                ),
                heightSizedBox(),

                RecommendedPackageCardHouseBoat(),

                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Promoted Agencies'),
                ),
                heightSizedBox(),
                AgencyCard(),

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
                    height: 10,
                  ),
                  itemBuilder: (context, index) => HouseBoatPackageCard(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
