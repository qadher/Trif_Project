import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/widgets.dart';

import '../home/components/titletext.dart';
import '../houseboat/components/packagecard_houseboat.dart';
import '../tours/components/kerala.dart';
import '../tours/imagesidescroller_tours.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSizedBox(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  suffixIcon: const Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: Colors.grey,
                  ),
                  style: TextStyle(fontSize: 18.sp, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: TitleText(text: 'Recomended Places'),
            ),
             SizedBox(
                    height: 10,
                  ),
                   Kerala(),
                  heightSizedBox(),
                  Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Recomended Packages'),
                ),
                  heightSizedBox(),

                RecommendedPackageCardHouseBoat(),

                heightSizedBox(),
          ],
        ),
      ),
    );
  }
}
