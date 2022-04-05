import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/components/viewall.dart';
import 'package:trip_calicut/screens/home/components/carousel.dart';
import 'package:trip_calicut/screens/trekking/components/packagecard_trecking.dart';

import '../home/components/packagecard.dart';
import '../home/components/titletext.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'components/truckingproviders.dart';

class TrekkingScreen extends StatelessWidget {
  const TrekkingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf5fb),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Trekking',
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
                  height: 20.h,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TitleText(text: 'Providers'),
                ),
                heightSizedBox(),
                TruckingProviders(),

              
                heightSizedBox(),

                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Results from Ollur...'),
                ),
                heightSizedBox(),
                PackageCardTrecking()
              ],
            ),
          ),
        ),
      ),
    );
  }

 
}

