import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/components/packagecard.dart';

import '../home/components/titletext.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../widgets.dart';

class HouseBoatScreen extends StatelessWidget {
  const HouseBoatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Resorts',
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
                  child: TitleText(text: 'Recomended Packages'),
                ),
                heightSizedBox(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        PackageCard(),
                        widthSizedBox(),
                        PackageCard(),
                        widthSizedBox(),
                        PackageCard(),
                        widthSizedBox(),
                        PackageCard(),
                        widthSizedBox(),
                        PackageCard(),
                        widthSizedBox(),
                        PackageCard(),
                        widthSizedBox(),
                        PackageCard(),
                        widthSizedBox(),
                        PackageCard(),
                        widthSizedBox(),
                        PackageCard(),
                      ],
                    ),
                  ),
                ),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Promoted Agencies'),
                ),
                heightSizedBox(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                      ],
                    ),
                  ),
                ),
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
                    height: 10.h,
                  ),
                  itemBuilder: (context, index) => PackageCard(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
