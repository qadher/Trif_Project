import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/camping/campingscreen.dart';
import 'package:trip_calicut/screens/home/components/catrgory.dart';
import 'package:trip_calicut/screens/home/components/switchescard.dart';
import 'package:trip_calicut/screens/home/components/titletext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trip_calicut/screens/home/components/topattractions.dart';
import 'package:trip_calicut/screens/homestay/homestayscreen.dart';
import 'package:trip_calicut/screens/houseboat/houseboatscreen.dart';
import 'package:trip_calicut/screens/resort/resortscreen.dart';
import 'package:trip_calicut/screens/tours/tourscreen.dart';
import 'package:trip_calicut/screens/travel/travelscreen.dart';
import 'package:trip_calicut/screens/trekking/trekkingscreen.dart';
import 'package:trip_calicut/widgets.dart';

import '../../components/packagecard.dart';
import 'components/carousel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Container with background image
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Image.network(
                  //   'https://images.unsplash.com/photo-1645379033960-72d6cb488c0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  color: Colors.black.withOpacity(0.3),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.10,
                  left: MediaQuery.of(context).size.width * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Let’s Explore \nThe World',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                          fontFamily: 'SpectralSC',
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Thrissur, Kerala',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'Lato'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25),
                  decoration: BoxDecoration(
                    color: Color(0xffebf5fb),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Category(
                        categoryname: categoryLists,
                      ),

                      // SizedBox(
                      //   height: 25.h,
                      // ),
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TitleText(text: 'Top Attractions'),
                      ),
                      TopAttractionCard(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TitleText(text: 'Nearby Places'),
                      ),
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleText(text: 'Trif Switches'),
                            SizedBox(
                              height: 10.h,
                            ),
                            Switches(categoryname: trifSwitches),
                            SizedBox(
                              height: 10.h,
                            ),
                            // TitleText(text: 'Trifs Vodcasts'),
                            // SizedBox(
                            //   height: 10.h,
                            // ),
                            // Container(
                            //   padding: EdgeInsets.all(8),
                            //   decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(20)),
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         height: 100.h,
                            //         width:
                            //             MediaQuery.of(context).size.width / 2.5,
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(20),
                            //           image: DecorationImage(
                            //             image: AssetImage(
                            //                 'assets/images/imageone.jpg'),
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //       ),
                            //       SizedBox(
                            //         width: 10.w,
                            //       ),
                            //       Expanded(
                            //         child: Column(
                            //           children: [
                            //             Text(
                            //               'Wayanadan Vibes',
                            //               style: TextStyle(
                            //                 fontFamily: 'Lato',
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               height: 10.h,
                            //             ),
                            //             Text(
                            //               'Wayanad is a rural district in Kerala state, southwest India. In the east, the Wayanad Wildlife Sanctuary is a lush, forested region with areas of ....',
                            //               maxLines: 3,
                            //               style: TextStyle(
                            //                 overflow: TextOverflow.ellipsis,
                            //                 fontSize: 10.sp,
                            //                 fontFamily: 'Lato',
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TitleText(text: 'Recommended Packages'),
                            SizedBox(
                              height: 10.h,
                            ),
                            PackageCardList()
                          ],
                        ),
                      ),
                    ],
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

