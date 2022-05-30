import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/components/promotedpackage.dart';
import 'package:trip_calicut/controllers/tourcategoriescontroller.dart';
import 'package:trip_calicut/screens/tours/components/kerala.dart';
import 'package:trip_calicut/screens/home/components/titletext.dart';
import 'package:trip_calicut/screens/tours/components/carousel.dart';
import 'package:trip_calicut/screens/tours/components/districts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:trip_calicut/screens/tours/components/shimmertourscreen.dart';
import 'package:trip_calicut/screens/tours/imagesidescroller_tours.dart';
import 'package:trip_calicut/screens/tours/insidescroller.dart';
import 'package:trip_calicut/widgets.dart';

import '../../components/viewall.dart';
import '../../constant/api.dart';
import '../../controllers/keraladistrictcardcontroller.dart';
import '../home/components/carousel.dart';
import '../widgets.dart';
import 'components/AppBarWidget.dart';
import 'components/staggered_grid.dart';
import 'components/categoryscrolllist.dart';

class TourScreen extends StatelessWidget {
  final KeralaDistrictCardController districtTourPageController =
      Get.put(KeralaDistrictCardController());
  final TourCategoriesController tourCategoriesController =
      Get.put(TourCategoriesController());

  TourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf5fb),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Tours',
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        }, child: Obx(() {
          if (districtTourPageController.isLoading.value) {
            return ShimmerTourScreen();
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // adsBanner(context),
                  PromotedPackage(sectionType: 'Tours'),
                  // Container(
                  //   height: 25.h,
                  //   decoration:
                  //       BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  //   width: MediaQuery.of(context).size.width,
                  //   child: CarouselSlider(
                  //     options: CarouselOptions(
                  //         autoPlay: true,
                  //         aspectRatio: 2.0,
                  //         autoPlayInterval: const Duration(seconds: 2),
                  //         enlargeCenterPage: false,
                  //         viewportFraction: 1),
                  //     items: imageSlidersBanner,
                  //   ),
                  // ),
                  heightSizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TitleText(text: 'Kerala > Districts'),
                  ),
                  heightSizedBox(),
                  // District(),
                  Kerala(),
                  // heightSizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TitleText(text: 'Categories'),
                  ),
                  heightSizedBox(),
                  Container(
                      height: 20.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider.builder(
                        itemCount: tourCategoriesController
                            .categoriesData.value.length,
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          // viewportFraction: 1,
                        ),
                        itemBuilder: (BuildContext context, int index,
                                int pageViewIndex) =>
                            Container(
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                color: Color.fromARGB(255, 192, 192, 192),
                                child: tourCategoriesController.categoriesData
                                            .value[index].image!.isEmpty ||
                                        tourCategoriesController.categoriesData
                                                .value[index].image ==
                                            null 
                                    ? Image.asset(
                                        'assets/images/no_image/noimage_landscape.jpeg',
                                        fit: BoxFit.cover,
                                        width: 1000.0)
                                    : Image.network(
                                        Api.imageUrl +
                                            '${tourCategoriesController.categoriesData.value[index].image}',
                                        fit: BoxFit.cover,
                                        width: 1000.0),
                              )),
                        ),
                      )),
                  // Container(
                  //   height: 25.h,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: CarouselSlider(
                  //     options: CarouselOptions(
                  //       autoPlay: true,
                  //       aspectRatio: 2.0,
                  //       enlargeCenterPage: true,
                  //     ),
                  //     items: imageSliders,
                  //   ),
                  // ),
                  heightSizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ViewAll(
                      text: 'Top Destinations',
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  insideScrollerTours(context),
                  heightSizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TitleText(text: 'Gallery'),
                  ),
                  heightSizedBox(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    //height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: StaggeredPage(),
                  ),
                ],
              ),
            );
          }
        })),
      ),
    );
  }
}
