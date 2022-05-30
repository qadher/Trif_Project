import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/screens/home/components/catrgory.dart';
import 'package:trip_calicut/screens/home/components/switchescard.dart';
import 'package:trip_calicut/screens/home/components/titletext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trip_calicut/screens/home/components/topattractions.dart';

import '../../components/locationcontroller.dart';
import '../../controllers/attractionapicardcontroller.dart';
import '../../controllers/houseboatapicardcontroller.dart';
import '../../controllers/packageapicardcontroller.dart';
import '../../controllers/promotedpackagesapicontroller.dart';
import 'components/packagecard.dart';
import 'components/carousel.dart';
import 'components/shimmerhomescreen.dart';

final PromotedPackageApiController promotedPackageController =
    Get.put(PromotedPackageApiController());

class HomeScreen extends StatelessWidget {
  final AttractionApiCardController attractionController =
      Get.put(AttractionApiCardController());
  final PackageApiCardController packageController =
      Get.put(PackageApiCardController());

  final LocationController locationController = Get.put(LocationController());

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
          child: Obx(
            () {
              if (promotedPackageController.isLoading.value) {
                return ShimmerHomeScreen();
              } else {
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.33,
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
                        height: MediaQuery.of(context).size.height * 0.33,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1,
                              ),
                              child: Text(
                                'Let’s Explore \nThe World',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  fontFamily: 'SpectralSC',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 18.sp,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // Text(
                                  //   '${locationController.address.value}',
                                  //   // 'Location',
                                  //   style: TextStyle(
                                  //       color: Colors.white,
                                  //       fontSize: 12.sp,
                                  //       fontFamily: 'Lato'),
                                  // ),
                                  Obx(
                                    () => Text(
                                      '${locationController.address.value}',
                                      // 'Location',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontFamily: 'Lato'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              // margin: EdgeInsets.only(
                              //     top: MediaQuery.of(context).size.height * 0.28
                              //     ),
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
                                    height: 2.h,
                                  ),
                                  Category(
                                    categoryname: categoryLists,
                                  ),

                                  // SizedBox(
                                  //   height: 2.h,
                                  // ),

                                  //promoted
                                  PromotedHomePage(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: TitleText(text: 'Top Attractions'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TopAttractionCard(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 16),
                                  //   child: TitleText(text: 'Nearby Places'),
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Container(
                                  //   height: 23.h,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius:
                                  //           BorderRadius.circular(20)),
                                  //   width: MediaQuery.of(context).size.width,
                                  //   child: CarouselSlider(
                                  //     options: CarouselOptions(
                                  //       autoPlay: true,
                                  //       aspectRatio: 2.0,
                                  //       enlargeCenterPage: true,
                                  //       // viewportFraction: 1,
                                  //     ),
                                  //     items: imageSliders,
                                  //   ),
                                  // ),

                                  //start

                                  // Container(
                                  //   height: 23.h,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius:
                                  //           BorderRadius.circular(20)),
                                  //   width: MediaQuery.of(context).size.width,
                                  //   child: CarouselSlider(
                                  //     options: CarouselOptions(
                                  //       autoPlay: true,
                                  //       aspectRatio: 2.0,
                                  //       enlargeCenterPage: true,
                                  //       // viewportFraction: 1,
                                  //     ),
                                  //     items: [
                                  //       nearbySliderWidget(
                                  //           'assets/images/ads.png'),
                                  //       nearbySliderWidget(
                                  //           'assets/images/JCB.jpg'),
                                  //           nearbySliderWidget(
                                  //           'assets/images/background.jpg'),
                                  //     ],
                                  //   ),
                                  // ),

                                  //end

                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child:
                                              TitleText(text: 'Trif Switches'),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Switches(categoryname: trifSwitches),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: GestureDetector(
                                            onTap: () {
                                              print(list[0]);
                                            },
                                            child: TitleText(
                                                text: 'Recommended Packages'),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
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
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Container nearbySliderWidget(String image) {
    return Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.asset('$image', fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    // child: Text(
                    //   'No. ${imgList.indexOf(item)} image',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 20.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class PromotedHomePage extends StatelessWidget {
  PromotedHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (promotedPackageController.isLoading.value) {
        return CircularProgressIndicator();
      } else {
        return Container(
            height: 20.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: 3,
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: false,
                  viewportFraction: 1
                  // viewportFraction: 1,
                  ),
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) =>
                      GestureDetector(
                onTap: () {
                  Get.toNamed('/promotedsinglepage', arguments: [
                    promotedPackageController.promotedPackageData.value[index].district,
                    promotedPackageController.promotedPackageData.value[index].image,
                    promotedPackageController.promotedPackageData.value[index].amount,
                    promotedPackageController.promotedPackageData.value[index].days,
                    promotedPackageController,
                    promotedPackageController.promotedPackageData.value[index].type,
                    promotedPackageController.promotedPackageData.value[index].id,

                  ]);
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        color: Color.fromARGB(255, 192, 192, 192),
                        child: Stack(
                          children: <Widget>[
                            promotedPackageController.promotedPackageData
                                        .value[index].image!.isEmpty ||
                                    promotedPackageController
                                            .promotedPackageData
                                            .value[index]
                                            .image ==
                                        null
                                ? Image.asset(
                                    'assets/images/no_image/noimage_landscape.jpeg',
                                    fit: BoxFit.cover,
                                    width: 1000.0)
                                : Image.network(
                                    Api.imageUrl +
                                        '${promotedPackageController.promotedPackageData.value[index].image}',
                                    fit: BoxFit.cover,
                                    width: 1000.0),
                            Positioned(
                                top: 0,
                                child: Container(
                                  // width: 60.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    child: Text('Promoted',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontFamily: 'Lato',
                                        )),
                                  ),
                                ))
                          ],
                        ),
                      )),
                ),
              ),
            ));
      }
    });
  }
}
