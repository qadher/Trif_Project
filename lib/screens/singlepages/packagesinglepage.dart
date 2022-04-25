import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/keraladistrictcardcontroller.dart';
import 'package:trip_calicut/screens/jobs/components/FixedBottomSwitch.dart';
import 'package:trip_calicut/screens/tours/components/fixed_top_navigatio.dart';

import '../../controllers/packageapicardcontroller.dart';
import '../tours/components/staggered_grid.dart';

class PackageSinglePage extends StatelessWidget {
  final PackageApiCardController packageController =
      Get.put(PackageApiCardController());
  final KeralaDistrictCardController districtController =
      Get.put(KeralaDistrictCardController());
  final controllerValue = Get.arguments[0];
  final controller = Get.arguments[1];
  final image = Get.arguments[2];
  final name = Get.arguments[3];
  final price = Get.arguments[4];
  final place = Get.arguments[5];

  PackageSinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff00A6F6),
      backgroundColor: Color(0xff00A6F6),
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
                                                    Colors.black
                                                        .withOpacity(0.4),
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
                                                    Colors.black
                                                        .withOpacity(0.4),
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
                                                    : place
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
                                            color: Color.fromARGB(
                                                255, 160, 14, 14),
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
                                            fontSize: 22,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4,
                                                  right: 8,
                                                  left: 8,
                                                  bottom: 8),
                                              child: Container(
                                                height: 40,
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
                                                  labelStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  unselectedLabelStyle:
                                                      TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  indicator: BoxDecoration(
                                                    color: Color(0xffE5E5E5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  // isScrollable: true,
                                                  labelColor: Colors.black,
                                                  unselectedLabelColor:
                                                      Colors.black,
                                                  tabs: [
                                                    Text(
                                                      'Rooms',
                                                    ),

                                                    Text(
                                                      'Videos',
                                                    ),
                                                    Text(
                                                      'Gallery',
                                                    ),
                                                    // Icon(Icons.abc),
                                                    // Icon(Icons.heart_broken),
                                                    // Icon(Icons.verified_user),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              constraints: BoxConstraints(
                                                maxHeight:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.50,
                                                minHeight:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.50,
                                              ),
                                              child: TabBarView(
                                                children: <Widget>[
                                                  GestureDetector(
                                                      onTap: () {},
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                                height: 10),
                                                            priceData(),
                                                            SizedBox(
                                                                height: 10),
                                                            priceData(),
                                                            SizedBox(
                                                                height: 10),
                                                            priceData(),
                                                            SizedBox(
                                                                height: 10),
                                                            Text('Aminities'),
                                                            SizedBox(
                                                                height: 10),
                                                            GridView.builder(
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              shrinkWrap: true,
                                                              gridDelegate:
                                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    3,
                                                                crossAxisSpacing:
                                                                    15,
                                                                mainAxisSpacing:
                                                                    15,
                                                                mainAxisExtent:
                                                                    25,
                                                              ),
                                                              itemCount: 6,
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index) {
                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade400,
                                                                        width:
                                                                            0),
                                                                  ),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Icon(Icons
                                                                          .alarm),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Container(
                                                                        child:
                                                                            Text(
                                                                          '24-Hour Front Desk',
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(fontSize: 7),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            Text(
                                                                'Near by Attractions'),
                                                            SizedBox(
                                                                height: 10),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          16),
                                                              // color: Colors.red,
                                                              child: GridView
                                                                  .builder(
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                shrinkWrap:
                                                                    true,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      3,
                                                                  crossAxisSpacing:
                                                                      15,
                                                                  mainAxisSpacing:
                                                                      5,
                                                                  mainAxisExtent:
                                                                      14.h,
                                                                ),
                                                                itemCount: 6,
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int index) {
                                                                  return Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(4),
                                                                        child: image.isEmpty ||
                                                                                image == null
                                                                            ? Container(
                                                                                // width: MediaQuery.of(context).size.width * 0.25,
                                                                                height: MediaQuery.of(context).size.height * 0.10,

                                                                                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imageone.jpg'), fit: BoxFit.cover), color: Colors.amber, borderRadius: BorderRadius.circular(20)),
                                                                                // child: Center(child: Text('$index')),
                                                                              )
                                                                            : Container(
                                                                                // width: MediaQuery.of(context).size.width * 0.25,
                                                                                height: MediaQuery.of(context).size.height * 0.10,

                                                                                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(Api.imageUrl + '${districtController.districtData.value[index].image}'), fit: BoxFit.cover), color: Colors.amber, borderRadius: BorderRadius.circular(20)),
                                                                                // child: Center(child: Text('$index')),
                                                                              ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 8),
                                                                        child:
                                                                            Text(
                                                                          '${districtController.districtData.value[index].name}',
                                                                          maxLines:
                                                                              1,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                10.sp,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color:
                                                                                Colors.black87,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 20),
                                                          ],
                                                        ),
                                                      )),
                                                  // EducationList(),
                                                  // EducationList(),
                                                  Container(
                                                      color: Color.fromARGB(
                                                          255, 253, 251, 251),
                                                      padding: EdgeInsets.only(
                                                          right: 16,
                                                          left: 16,
                                                          bottom: 20),
                                                      // color: Colors.red,
                                                      child: ListView.separated(
                                                          separatorBuilder:
                                                        (context,
                                                                index) =>
                                                            SizedBox(
                                                      height: 10,
                                                          ),
                                                          itemCount: 5,
                                                          itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color
                                                              .fromARGB(
                                                                  255,
                                                                  236,
                                                                  235,
                                                                  235),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5),
                                                        ),
                                                        padding:
                                                            EdgeInsets
                                                                .all(4),
                                                        child: ListTile(
                                                          leading:
                                                              ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            child: Image
                                                                .asset(
                                                                    'assets/images/imageone.jpg'),
                                                          ),
                                                          title: Text(
                                                              "hello"),
                                                          subtitle: Text(
                                                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                                              maxLines: 4,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      );
                                                          },
                                                        )),
                                                  // EducationList(),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16),
                                                    // color: Colors.red,
                                                    child: GridView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 15,
                                                        mainAxisSpacing: 5,
                                                        mainAxisExtent: 14.h,
                                                      ),
                                                      itemCount: 6,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          child:
                                                              image.isEmpty ||
                                                                      image ==
                                                                          null
                                                                  ? Container(
                                                                      // width: MediaQuery.of(context).size.width * 0.25,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.10,

                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: AssetImage(
                                                                                  'assets/images/imageone.jpg'),
                                                                              fit: BoxFit
                                                                                  .cover),
                                                                          color: Colors
                                                                              .amber,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20)),
                                                                      // child: Center(child: Text('$index')),
                                                                    )
                                                                  : Container(
                                                                      // width: MediaQuery.of(context).size.width * 0.25,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.10,

                                                                      decoration: BoxDecoration(
                                                                          image: DecorationImage(
                                                                              image: NetworkImage(Api.imageUrl +
                                                                                  '${districtController.districtData.value[index].image}'),
                                                                              fit: BoxFit
                                                                                  .cover),
                                                                          color: Colors
                                                                              .amber,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20)),
                                                                      // child: Center(child: Text('$index')),
                                                                    ),
                                                        );
                                                      },
                                                    ),
                                                  ),
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
      ),
    );
  }

  Container priceData() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Color(0xffE5E5E5), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Super Delux",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text("Rooms Available 5",
                  style: TextStyle(fontSize: 12, color: Colors.red)),
            ],
          ),
          Column(
            children: [
              Text("₹500", style: TextStyle(fontSize: 16, color: Colors.blue)),
              Text("₹600",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough)),
            ],
          )
        ],
      ),
    );
  }
}
