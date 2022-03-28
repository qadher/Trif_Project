import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/components/packagecard.dart';
import 'package:trip_calicut/screens/home/components/topattractions.dart';

import '../home/components/titletext.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../widgets.dart';

class HomeStayScreen extends StatelessWidget {
  const HomeStayScreen({Key? key}) : super(key: key);

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
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                adsBanner(context),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Nearby Places'),
                ),
                heightSizedBox(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        TopAttractions(),
                        widthSizedBox(),
                        TopAttractions(),
                        widthSizedBox(),
                        TopAttractions(),
                        widthSizedBox(),
                        TopAttractions(),
                        widthSizedBox(),
                        TopAttractions(),
                        widthSizedBox(),
                        TopAttractions(),
                        widthSizedBox(),
                        TopAttractions(),
                        widthSizedBox(),
                        TopAttractions(),
                        widthSizedBox(),
                        TopAttractions(),
                      ],
                    ),
                  ),
                ),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Discover Homestays'),
                ),
                heightSizedBox(),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: PackageCard(),
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
