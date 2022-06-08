import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/screens/education/components/control_bar.dart';
import 'package:trip_calicut/screens/home/components/carousel.dart';
import 'package:trip_calicut/screens/jobs/components/joblist.dart';

import '../../components/promotedpackage.dart';
import '../home/components/packagecard.dart';
import '../home/components/titletext.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../tours/components/categoryscrolllist.dart';
import '../widgets.dart';
import '../houseboat/components/agencylist/houseboatlist.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Education',
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
                PromotedPackage(sectionType: 'Education'),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'District'),
                ),
                heightSizedBox(),
                CategoryScrollList(),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Course type'),
                ),
                heightSizedBox(),
                Container(
                  // height: 700,
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                    // borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(40),
                    //     topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      DefaultTabController(
                        length: 3,
                        child: Column(
                          children: [
                            Container(
                              height: 7.h,
                              width: 95.w,
                              // margin: const EdgeInsets.only(
                              //     top: 20, left: 20, right: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                // border: Border.all(
                                //     color: Colors.grey.shade400,
                                //     width: 0),
                              ),
                              child: TabBar(
                                
                                indicator: BoxDecoration(
                                  
                                  color: Color(0xff00A6F6),
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.grey.shade400),
                                ),
                                // isScrollable: true,
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Text(
                                    'Bachelors',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.white,
                                        ),
                                  ),

                                  Text(
                                    'Masters',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    'Doctorate/Phd',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.white,
                                        ),
                                  ),
                                  // Icon(Icons.abc),
                                  // Icon(Icons.heart_broken),
                                  // Icon(Icons.verified_user),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20),
                              constraints: BoxConstraints(
                                maxHeight: 80.h,
                                minHeight: 80.h,
                              ),
                              child: TabBarView(
                                children: <Widget>[
                                  // EducationList(),
                                  // EducationList(),
                                  // EducationList(),
                                  Container(),
                                  Container(),
                                  Container(),
                                  // Card(
                                  //   color: Color(0xffE5E5E5),
                                  //   child: ListTile(
                                  //     leading: const Icon(Icons.home),
                                  //     title: TextField(
                                  //       decoration: const InputDecoration(
                                  //           hintText: 'Search for address...'),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Card(
                                  //   child: ListTile(
                                  //     leading: const Icon(Icons.location_on),
                                  //     title: Text(
                                  //         'Latitude: 48.09342\nLongitude: 11.23403'),
                                  //     trailing: IconButton(
                                  //         icon: const Icon(Icons.my_location),
                                  //         onPressed: () {}),
                                  //   ),
                                  // ),
                                  // Card(
                                  //   child: ListTile(
                                  //     leading: const Icon(Icons.location_on),
                                  //     title: Text(
                                  //         'Latitude: 48.09342\nLongitude: 11.23403'),
                                  //     trailing: IconButton(
                                  //         icon: const Icon(Icons.my_location),
                                  //         onPressed: () {}),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // ControlSwitch(),

                // EducationList(),

                heightSizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
