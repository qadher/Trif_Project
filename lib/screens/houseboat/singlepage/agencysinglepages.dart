import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/controllers/agencyapicontroller.dart';
import 'package:trip_calicut/screens/jobs/components/FixedBottomSwitch.dart';
import 'package:trip_calicut/widgets.dart';

import '../../education/components/education_list.dart';

class AgencySinglePages extends StatelessWidget {
  final AgencyApiController controller = Get.put(AgencyApiController());

  AgencySinglePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: Container(),
              );
            } else {
              return AppBar(
                backgroundColor: Colors.white,
                title: Text('Agency', style: TextStyle(color: Colors.blue)),
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Get.offNamed('/houseboat');
                    }),
              );
            }
          })),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        }, child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        heightSizedBox(),
                        Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 20),
                              // height: 305.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 130,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/studyabroad.png'),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            color: Colors.black),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          width: 150,
                                          height: 30,
                                          child: Center(
                                            child: Text(
                                              '40+ Countries',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white60,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(30),
                                                topRight: Radius.circular(20)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 70),
                                            width: 180,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 4),
                                                  child: Text(
                                                    'Agency',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_pin,
                                                      size: 18,
                                                      color: Color(0xFF00A6F6),
                                                    ),
                                                    Text(
                                                      'Ernakulam',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            'Three months ago, we launched the new Smart Upscaler with the unique face processing feature. Now, we’ve made it even better.',
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                            maxLines: 5,
                                          ),
                                          
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 95,
                              left: 10,
                              child: CircleAvatar(
                                radius: 38,
                                backgroundImage:
                                    AssetImage('assets/images/profile.png'),
                              ),
                            ),
                          ],
                        ),
                        heightSizedBox(),
                        Container(
                          // height: 700,
                          decoration: BoxDecoration(
                            color: Color(0xffE5E5E5),
                          ),
                          child: Column(
                            children: [
                              DefaultTabController(
                                length: 6,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 7.h,
                                      width: 95.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: TabBar(
                                        indicator: BoxDecoration(
                                          color: Color(0xff00A6F6),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.grey.shade400),
                                        ),
                                        // isScrollable: true,
                                        labelColor: Colors.white,
                                        unselectedLabelColor: Colors.black,
                                        isScrollable: true,
                                        tabs: [
                                          Text(
                                            'Houseboat',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Camping',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Resort',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Travel',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Trekking',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Homestay',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      constraints: BoxConstraints(
                                        maxHeight: 80.h,
                                        minHeight: 80.h,
                                      ),
                                      child: TabBarView(
                                        children: <Widget>[
                                          EducationList(),
                                          EducationList(),
                                          EducationList(),
                                          EducationList(),
                                          EducationList(),
                                          EducationList(),

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
                  ),
                  FixedBottomSwitch(),
                ],
              ),
            );
          }
        })),
      ),
    );
  }
}
