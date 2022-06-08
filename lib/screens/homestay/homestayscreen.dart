import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/screens/home/components/packagecard.dart';
import 'package:trip_calicut/screens/home/components/carousel.dart';
import 'package:trip_calicut/screens/home/components/topattractions.dart';

import '../../components/commonshimmer.dart';
import '../../components/promotedpackage.dart';
import '../../controllers/homestaypackageapicardcontroller.dart';
import '../../controllers/resortapicardcontroller.dart';
import '../home/components/titletext.dart';
import '../resort/components/nearbyplaces.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import 'components/packagehomestay.dart';

class HomeStayScreen extends StatelessWidget {
  final ResortApiCardController nearbyController = Get.put(ResortApiCardController());
  final HomeStayPackageApiCardController homestayController = Get.put(HomeStayPackageApiCardController());
  HomeStayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf5fb),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'HomeStay',
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        }, child: Obx(() {
          if (nearbyController.isLoading.value || homestayController.isLoading.value) {
            return CommonShimmer();
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // adsBanner(context),
                  PromotedPackage(sectionType: 'HomeStay'),
                  heightSizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TitleText(text: 'Nearby Places'),
                  ),
                  heightSizedBox(),
                  NearbyPlaces(),
                  heightSizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TitleText(text: 'Discover Homestays'),
                  ),
                  heightSizedBox(),
                  PackageHomeStay(),
                ],
              ),
            );
          }
        })),
      ),
    );
  }
}
