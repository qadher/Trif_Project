import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/screens/jobs/components/FixedBottomSwitch.dart';
import 'package:trip_calicut/screens/tours/components/fixed_top_navigatio.dart';

import '../tours/components/staggered_grid.dart';

class PlaceSinglePage extends StatelessWidget {
  final controllerValue = Get.arguments[0];
  final controller = Get.arguments[1];
  final image = Get.arguments[2];
  final name = Get.arguments[3];
  final price = Get.arguments[4];
  final place = Get.arguments[5];

  PlaceSinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff00A6F6),
      backgroundColor: Color(0xff00A6F6),
      body: SafeArea(child: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Stack(
            children: <Widget>[
              SingleChildScrollView(
                clipBehavior: Clip.none,
                child: Column(
                  children: [
                    Container(
                      // height: 2000.h,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              image!.isEmpty || image == null
                                  ? Container(
                                      height: 500,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black.withOpacity(0.4),
                                                  BlendMode.darken),
                                              image: AssetImage(
                                                  'assets/images/imageone.jpg'),
                                              fit: BoxFit.cover),
                                          color: Colors.black),
                                    )
                                  : Container(
                                      height: 500,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black.withOpacity(0.4),
                                                  BlendMode.darken),
                                              image: NetworkImage(
                                                  Api.imageUrl + image),
                                              fit: BoxFit.cover),
                                          color: Colors.black),
                                    ),
                              Positioned(
                                  bottom: 75,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              //first letter caps and rest lower
                                              name
                                                      .substring(0, 1)
                                                      .toUpperCase() +
                                                  name
                                                      .substring(1)
                                                      .toLowerCase(),
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              place!.isEmpty || place == null
                                                  ? 'Kerala'
                                                  : 
                                              place
                                                      .substring(0, 1)
                                                      .toUpperCase() +
                                                  place
                                                      .substring(1)
                                                      .toLowerCase()
                                                      .split(' ')[0],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.favorite_outline,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 160, 14, 14),
                                        ),
                                      ],
                                    ),
                                  )),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  child: Center(
                                    child: Text(
                                      'Price Starts from ₹${price}/-',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xff00A6F6),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40))),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: Color(0xff00A6F6),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40)),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DefaultTabController(
                                      length: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            // width: 95,
                                            // margin: const EdgeInsets.only(
                                            //     top: 20, left: 20, right: 20),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              // border: Border.all(
                                              //     color: Colors.grey.shade400,
                                              //     width: 0),
                                            ),
                                            child: TabBar(
                                              indicator: BoxDecoration(
                                                color: Color(0xffE5E5E5),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              // isScrollable: true,
                                              labelColor: Colors.white,
                                              unselectedLabelColor:
                                                  Colors.black,
                                              tabs: [
                                                Text(
                                                  'History',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),

                                                Text(
                                                  'Places',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  'Gallery',
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                // Icon(Icons.abc),
                                                // Icon(Icons.heart_broken),
                                                // Icon(Icons.verified_user),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 20),
                                            constraints: BoxConstraints(
                                              maxHeight: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.50,
                                              minHeight: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.50,
                                            ),
                                            child: TabBarView(
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: () {
                                                    print(Api.imageUrl + image);
                                                  },
                                                  child: Text(
                                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
                                                     
                                                ),
                                                // EducationList(),
                                                // EducationList(),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16),
                                                  // color: Colors.red,
                                                  child: GridView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      crossAxisSpacing: 15.w,
                                                      mainAxisSpacing: 5,
                                                      mainAxisExtent: 14.h,
                                                    ),
                                                    itemCount: 9,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4),
                                                            child:
                                                                image.isEmpty ||
                                                                        image ==
                                                                            null
                                                                    ? Container(
                                                                        // width: MediaQuery.of(context).size.width * 0.25,
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.10,

                                                                        decoration: BoxDecoration(
                                                                            image:
                                                                                DecorationImage(image: AssetImage('assets/images/imageone.jpg'), fit: BoxFit.cover),
                                                                            color: Colors.amber,
                                                                            borderRadius: BorderRadius.circular(20)),
                                                                        // child: Center(child: Text('$index')),
                                                                      )
                                                                    : Container(
                                                                        // width: MediaQuery.of(context).size.width * 0.25,
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.10,

                                                                        decoration: BoxDecoration(
                                                                            image:
                                                                                DecorationImage(image: NetworkImage(Api.imageUrl + image), fit: BoxFit.cover),
                                                                            color: Colors.amber,
                                                                            borderRadius: BorderRadius.circular(20)),
                                                                        // child: Center(child: Text('$index')),
                                                                      ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 4),
                                                            child: Text(
                                                              '${controllerValue.name}',
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black87,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                                // EducationList(),
                                                StaggeredPage(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FixedBottomSwitch(),
              FixedTopNavigation(),
            ],
          );
        }
      })),
    );
  }
}
