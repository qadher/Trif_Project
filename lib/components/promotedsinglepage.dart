import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/hive/Repository/repository.dart';
import 'package:trip_calicut/hive/database/model/db_model.dart';
import 'package:trip_calicut/screens/tours/components/fixed_top_navigatio.dart';

import '../hive/controller/db_controller.dart';
import '../services/apiservice.dart';

class PromotedSinglePage extends StatelessWidget {
  final String district = Get.arguments[0];
  final image = Get.arguments[1];
  final int amount = Get.arguments[2];
  final int days = Get.arguments[3];
  final controller = Get.arguments[4];
  final String type = Get.arguments[5];
  final int itemId = Get.arguments[6];
  final int agencyId = Get.arguments[7];
  
  final DbController = Get.put(DBController());
  IconData? icon;

  PromotedSinglePage({Key? key}) : super(key: key);

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
            icon = DbController.updateIcon(name: type);
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
                                image.isEmpty ||
                                        image == null
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
                                                    Api.imageUrl +
                                                        image
                                                            .toString()),
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
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.80,
                                                child: Text(
                                                  //first letter caps and rest lower
                                                  //split with two words
                                                  type
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,

                                                  //     .substring(0, 1)
                                                  //     .toUpperCase() +
                                                  // controller.packageData.value.name!
                                                  //     .substring(1)
                                                  //     .toLowerCase(),
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                district ==
                                                        null
                                                    ? 'Kerala'
                                                    : "${district},",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.white70),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await DbController.updateFav(
                                                name: type
                                                    .toString(),
                                                item: TrifsDB(
                                                    id: itemId,
                                                    type: type,
                                                    image: image,
                                                    title: type
                                                        .toString(),
                                                    desc: type,
                                                    fav: true),
                                              );
                                              final data =
                                                  RepositoryBox.getBox();
                                              
                                              
                                              // DbController.observableBox.clear();
                                            },
                                            child: Icon(
                                              icon,
                                              size: 30,
                                              color: Color.fromARGB(
                                                  255, 160, 14, 14),
                                            ),
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Price Starts from ₹${amount}/-',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
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
                                                    fontSize: 14,
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
                                                      'Description',
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
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  height: 10),
                                                              Text(
                                                                '${type}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Text(
                                                                '${days}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                              // ElevatedButton(onPressed: (){
                                                              //   print(houseBoatPackageItemId);
                                                              // }, child: Text('Book Now'),),
                                                              SizedBox(
                                                                  height: 30),
                                                            ],
                                                          ),
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
                                                            (context, index) =>
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
                                                                EdgeInsets.all(
                                                                    4),
                                                            child: ListTile(
                                                              //leading
                                                              title:
                                                                  Text("hello"),
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

                                                  // FutureBuilder<
                                                  //     HouseBoatGalleryModel>(
                                                  //   future: futureGallery,
                                                  //   builder:
                                                  //       (context, snapshot) {
                                                  //     if (snapshot.hasData) {
                                                  //       return Container(
                                                  //         padding: EdgeInsets
                                                  //             .symmetric(
                                                  //                 horizontal:
                                                  //                     16),
                                                  //         // color: Colors.red,
                                                  //         child:
                                                  //             GridView.builder(
                                                  //           physics:
                                                  //               NeverScrollableScrollPhysics(),
                                                  //           shrinkWrap: true,
                                                  //           gridDelegate:
                                                  //               SliverGridDelegateWithFixedCrossAxisCount(
                                                  //             crossAxisCount: 3,
                                                  //             crossAxisSpacing:
                                                  //                 15,
                                                  //             mainAxisSpacing:
                                                  //                 5,
                                                  //             mainAxisExtent:
                                                  //                 14.h,
                                                  //           ),
                                                  //           itemCount: snapshot
                                                  //               .data!
                                                  //               .images!
                                                  //               .length,
                                                  //           itemBuilder:
                                                  //               (BuildContext
                                                  //                       context,
                                                  //                   int index) {
                                                  //             return Padding(
                                                  //               padding:
                                                  //                   const EdgeInsets
                                                  //                       .all(4),
                                                  //               child: snapshot
                                                  //                           .data!
                                                  //                           .images!
                                                  //                           .isEmpty ||
                                                  //                       snapshot.data!.images ==
                                                  //                           null
                                                  //                   ? Container(
                                                  //                       // width: MediaQuery.of(context).size.width * 0.25,
                                                  //                       height: MediaQuery.of(context).size.height *
                                                  //                           0.10,

                                                  //                       decoration: BoxDecoration(
                                                  //                           image:
                                                  //                               DecorationImage(image: AssetImage('assets/images/imageone.jpg'), fit: BoxFit.cover),
                                                  //                           color: Colors.amber,
                                                  //                           borderRadius: BorderRadius.circular(20)),
                                                  //                       // child: Center(child: Text('$index')),
                                                  //                     )
                                                  //                   : Container(
                                                  //                       // width: MediaQuery.of(context).size.width * 0.25,
                                                  //                       height: MediaQuery.of(context).size.height *
                                                  //                           0.10,

                                                  //                       decoration: BoxDecoration(
                                                  //                           image:
                                                  //                               DecorationImage(image: NetworkImage(Api.imageUrl + '${snapshot.data!.images![index].image}'), fit: BoxFit.cover),
                                                  //                           color: Colors.amber,
                                                  //                           borderRadius: BorderRadius.circular(20)),
                                                  //                       // child: Center(child: Text('$index')),
                                                  //                     ),
                                                  //             );
                                                  //           },
                                                  //         ),
                                                  //       );
                                                  //     } else if (snapshot
                                                  //         .hasError) {
                                                  //       return Text(
                                                  //           "${snapshot.error}");
                                                  //     }
                                                  //     return CircularProgressIndicator();
                                                  //   },
                                                  // ),
                                                  Container()
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
                // FixedBottomSwitch(),
                // Bottom Switch enquiry and call Now
                Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('enquiry clicked');
                              //loginMethod();
                              enquiryMethod(
                                  type: '${type}',
                                  packageType: 'HouseBoats',
                                  packageId: '${itemId}',
                                  agencyId:
                                      '${agencyId}',
                                  customerId: '111');
                              // succes show dialog
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Enquiry'),
                                      content: Text(
                                          'Thank you for your Enquiry. We will respond as soon as possible'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });

                              
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff00A6F6),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    topLeft: Radius.circular(50)),
                              ),
                              alignment: Alignment.center,
                              height: 45,
                              width: 150,
                              child: Text(
                                'Enquiry Now',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff00A6F6),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  topRight: Radius.circular(50)),
                            ),
                            alignment: Alignment.center,
                            height: 45,
                            width: 150,
                            child: GestureDetector(
                              onTap: () async{
                                enquiryMethod(
                                  type: 'Call',
                                  packageType: 'HouseBoats',
                                  packageId: '${itemId}',
                                  agencyId:
                                      '${agencyId}',
                                  customerId: '111');
                                // _callNumber();
                                // bool? res = await FlutterPhoneDirectCaller.callNumber('${snapshot.data!.agency!.mobile}');
                                bool? res = await FlutterPhoneDirectCaller.callNumber('6238265477');

                              },
                              child: Text(
                                'Call Now',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                FixedTopNavigation(),
              ],
            );
          }
        })),
      ),
    );
  }
}
