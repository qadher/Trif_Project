import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/packagecard.dart';
import '../home/components/titletext.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../tours/components/topdestination.dart';
import '../widgets.dart';

class TravelScreen extends StatelessWidget {
  const TravelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf5fb),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Travel',
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                        widthSizedBox(),
                        TopDestination(),
                      ],
                    ),
                  ),
                ),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Vehicles in Ollur...'),
                ),
                heightSizedBox(),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
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
