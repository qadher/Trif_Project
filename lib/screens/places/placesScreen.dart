import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/screens/home/components/titletext.dart';
import 'package:trip_calicut/screens/home/components/topattractions.dart';
import 'package:trip_calicut/screens/places/components/trending_now.dart';
import 'package:trip_calicut/screens/tours/components/AppBarWidget.dart';
import 'package:trip_calicut/screens/tours/components/districts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:trip_calicut/screens/tours/insidescroller.dart';
import 'package:trip_calicut/widgets.dart';

import '../../components/viewall.dart';
import '../home/components/carousel.dart';
import '../widgets.dart';
import 'components/placesdistrict.dart';

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
                // adsBanner(context),
                heightSizedBox(),
                Container(
                  height: 160,
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
                  child: TitleText(text: 'Kerala > Districts'),
                ),
                heightSizedBox(),
                PlacesDistrict(),

                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ViewAll(
                    text: 'Top Destinations',
                  ),
                ),
                heightSizedBox(),

                SizedBox(
                  height: 10,
                ),
                insideScroller(context),

                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TitleText(text: 'Trending Now '),
                ),

                TrendingNow(),
                heightSizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Column scrollCard() {
  //   return Column(
  //     children: [
  //       Stack(children: [
  //         Container(
  //           height: 80,
  //           width: 130,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //             border: Border.all(width: 0.8, color: Colors.white),
  //             image: DecorationImage(
  //               image: AssetImage('assets/images/background.jpg'),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //             bottom: 0,
  //             child: Container(
  //               width: 130,
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 3),
  //                 child: Center(
  //                   child: Text(
  //                     'Malampuzha Dam',
  //                     style: TextStyle(
  //                         color: Colors.white, fontWeight: FontWeight.w400),
  //                   ),
  //                 ),
  //               ),
  //               decoration: BoxDecoration(
  //                 color: Colors.black.withOpacity(0.4),
  //               ),
  //             ))
  //       ]),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Stack(children: [
  //         Container(
  //           height: 80,
  //           width: 130,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //             border: Border.all(width: 0.8, color: Colors.white),
  //             image: DecorationImage(
  //               image: AssetImage('assets/images/background.jpg'),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //             bottom: 0,
  //             child: Container(
  //               width: 130,
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 3),
  //                 child: Center(
  //                   child: Text(
  //                     'Malampuzha Dam',
  //                     style: TextStyle(
  //                         color: Colors.white, fontWeight: FontWeight.w400),
  //                   ),
  //                 ),
  //               ),
  //               decoration: BoxDecoration(
  //                 color: Colors.black.withOpacity(0.4),
  //               ),
  //             ))
  //       ]),
  //     ],
  //   );
  // }
}
