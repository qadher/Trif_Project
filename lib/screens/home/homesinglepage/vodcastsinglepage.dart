import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/screens/home/components/vodcastshomepage.dart';

import '../../../controllers/tourcategoriescontroller.dart';
import '../../../widgets.dart';
import '../../tours/components/AppBarWidget.dart';
import '../../tours/components/categoryscrolllist.dart';
import '../../tours/components/categoryslider.dart';

class VodcastSinglePage extends StatelessWidget {
  final TourCategoriesController tourCategoriesController = Get.put(TourCategoriesController());

  VodcastSinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf5fb),
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Vodcast',
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
              children: [
                CategorySlider(tourCategoriesController: tourCategoriesController),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CategoryScrollList(),
                ),
                heightSizedBox(),
                ListView.separated( 
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics() ,
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: VodcastsHomePage(),
                    );
                  
                  },
                )
                // VodcastsHomePage(),
              ],
            ),
          )),
    ));
  }
}
