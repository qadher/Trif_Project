import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/screens/home/attractionsinglepage/attractionsinglepagemodel.dart';
import 'package:trip_calicut/screens/home/homesinglepage/packagesinglepagemodel.dart';
import 'package:trip_calicut/screens/houseboat/singlepage/package/model/houseboatgallerymodel.dart';
import 'package:trip_calicut/screens/houseboat/singlepage/package/model/houseboatpackagemodel.dart';
import 'package:http/http.dart' as http;
import 'package:trip_calicut/screens/resort/singlepage/resortAmenitiesmodel.dart';
import 'package:trip_calicut/screens/resort/singlepage/resortsinglepagemodel.dart';
import 'package:trip_calicut/screens/resort/singlepage/superdeluxroommodel.dart';

import '../../jobs/components/FixedBottomSwitch.dart';
import '../../tours/components/fixed_top_navigatio.dart';

Future<ResortSinglePageModel> fetchSinglePage(int id) async {
  final response = await http.post(Uri.parse(Api.apiUrl + 'resorts/$id'));

// Appropriate action depending upon the

// server response
  if (response.statusCode == 200) {
    return ResortSinglePageModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<ResortAmenitiesModel> fetchAmenities(int id) async {
  final response =
      await http.post(Uri.parse(Api.apiUrl + 'resorts/amenities/$id'));

// Appropriate action depending upon the

// server response
  if (response.statusCode == 200) {
    return ResortAmenitiesModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<SuperDeluxRoomModel> fetchRooms(int id) async {
  final response = await http.post(Uri.parse(Api.apiUrl + 'resorts/rooms/$id'));

// Appropriate action depending upon the

// server response
  if (response.statusCode == 200) {
    return SuperDeluxRoomModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<HouseBoatGalleryModel> fetchGallery(int id) async {
  final response =
      await http.post(Uri.parse(Api.apiUrl + 'resorts/gallery/$id'));

// Appropriate action depending upon the
// server response
  if (response.statusCode == 200) {
    return HouseBoatGalleryModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class ResortSinglePagePackage extends StatefulWidget {
  ResortSinglePagePackage({Key? key}) : super(key: key);

  @override
  _ResortSinglePagePackageState createState() => _ResortSinglePagePackageState();
}

class _ResortSinglePagePackageState extends State<ResortSinglePagePackage> {
  Future<ResortSinglePageModel>? futurePackage;
  Future<HouseBoatGalleryModel>? futureGallery;
  Future<ResortAmenitiesModel>? futureAmenities;
  Future<SuperDeluxRoomModel>? futureRooms;

  @override
  void initState() {
    super.initState();
    futurePackage = fetchSinglePage(itemId);
    futureGallery = fetchGallery(itemId);
  }

  int itemId = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<ResortSinglePageModel>(
          future: futurePackage,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                                  snapshot.data!.resort!.image!.isEmpty ||
                                          snapshot.data!.resort!.image == null
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
                                                          snapshot.data!.resort!
                                                              .image
                                                              .toString()),
                                                  fit: BoxFit.cover),
                                              color: Colors.black),
                                        ),
                                  Positioned(
                                      bottom: 75,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18),
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
                                                    snapshot.data!.resort!.name
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
                                                  'Kerala',
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
                                          'Price Starts from ₹${snapshot.data!.resort!.offerAmount}/-',
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
                                                        BorderRadius.circular(
                                                            20),
                                                    // border: Border.all(
                                                    //     color: Colors.grey.shade400,
                                                    //     width: 0),
                                                  ),
                                                  child: TabBar(
                                                    labelStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                    unselectedLabelStyle:
                                                        TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(height: 10),
                                                          // FutureBuilder(
                                                          //     future:
                                                          //         futureRooms,
                                                          //     builder: (context,
                                                          //         snapshot) {
                                                          //       if (snapshot
                                                          //           .hasData) {
                                                          //         return ListView
                                                          //             .separated(
                                                          //           shrinkWrap:
                                                          //               true,
                                                          //           physics:
                                                          //               NeverScrollableScrollPhysics(),
                                                          //           itemCount: 6,
                                                          //           itemBuilder:
                                                          //               (context,
                                                          //                   index) {
                                                          //             return Container(
                                                          //               padding: EdgeInsets.symmetric(
                                                          //                   horizontal:
                                                          //                       16,
                                                          //                   vertical:
                                                          //                       8),
                                                          //               decoration: BoxDecoration(
                                                          //                   color:
                                                          //                       Color(0xffE5E5E5),
                                                          //                   borderRadius: BorderRadius.circular(10)),
                                                          //               child:
                                                          //                   Row(
                                                          //                 mainAxisAlignment:
                                                          //                     MainAxisAlignment.spaceBetween,
                                                          //                 children: [
                                                          //                   Column(
                                                          //                     crossAxisAlignment: CrossAxisAlignment.start,
                                                          //                     children: [
                                                          //                       Text(
                                                          //                         "${roomController.roomsData.value[index].name}",
                                                          //                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                          //                       ),
                                                          //                       Text("Rooms Available ${roomController.roomsData.value[index].rooms}", style: TextStyle(fontSize: 12, color: Colors.red)),
                                                          //                     ],
                                                          //                   ),
                                                          //                   Column(
                                                          //                     children: [
                                                          //                       Text("₹${roomController.roomsData.value[index].offerPrice}", style: TextStyle(fontSize: 16, color: Colors.blue)),
                                                          //                       Text("₹${roomController.roomsData.value[index].price}", style: TextStyle(fontSize: 12, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                                                          //                     ],
                                                          //                   )
                                                          //                 ],
                                                          //               ),
                                                          //             );
                                                          //           },
                                                          //           separatorBuilder:
                                                          //               (BuildContext
                                                          //                       context,
                                                          //                   int index) {
                                                          //             return SizedBox(
                                                          //               height:
                                                          //                   10,
                                                          //             );
                                                          //           },
                                                          //         );
                                                          //       }
                                                          //     }),
                                                          SizedBox(height: 10),
                                                          Text('Aminities'),
                                                          SizedBox(height: 10),
                                                          // GridView.builder(
                                                          //   physics:
                                                          //       NeverScrollableScrollPhysics(),
                                                          //   shrinkWrap: true,
                                                          //   gridDelegate:
                                                          //       SliverGridDelegateWithFixedCrossAxisCount(
                                                          //     crossAxisCount: 3,
                                                          //     crossAxisSpacing:
                                                          //         15,
                                                          //     mainAxisSpacing:
                                                          //         15,
                                                          //     mainAxisExtent:
                                                          //         25,
                                                          //   ),
                                                          //   itemCount:
                                                          //       amenitiesController
                                                          //           .amenitiesData
                                                          //           .value
                                                          //           .length,
                                                          //   itemBuilder:
                                                          //       (BuildContext
                                                          //               context,
                                                          //           int index) {
                                                          //     return Container(
                                                          //       decoration:
                                                          //           BoxDecoration(
                                                          //         borderRadius:
                                                          //             BorderRadius
                                                          //                 .circular(
                                                          //                     5),
                                                          //         color: Colors
                                                          //             .white,
                                                          //         border: Border.all(
                                                          //             color: Colors
                                                          //                 .grey
                                                          //                 .shade400,
                                                          //             width: 0),
                                                          //       ),
                                                          //       child: Row(
                                                          //         crossAxisAlignment:
                                                          //             CrossAxisAlignment
                                                          //                 .center,
                                                          //         mainAxisAlignment:
                                                          //             MainAxisAlignment
                                                          //                 .start,
                                                          //         children: [
                                                          //           amenitiesController.amenitiesData.value[index].image!.isEmpty ||
                                                          //                   amenitiesController.amenitiesData.value[index].image ==
                                                          //                       null
                                                          //               ? Icon(Icons
                                                          //                   .alarm)
                                                          //               : Container(
                                                          //                   height:
                                                          //                       15,
                                                          //                   width:
                                                          //                       15,
                                                          //                   decoration:
                                                          //                       BoxDecoration(
                                                          //                     image: DecorationImage(
                                                          //                       image: NetworkImage(Api.imageUrl + '${amenitiesController.amenitiesData.value[index].image}'),
                                                          //                       fit: BoxFit.cover,
                                                          //                     ),
                                                          //                   ),
                                                          //                 ),
                                                          //           SizedBox(
                                                          //             width: 5,
                                                          //           ),
                                                          //           Container(
                                                          //             width: MediaQuery.of(context)
                                                          //                     .size
                                                          //                     .width *
                                                          //                 0.20,
                                                          //             child: amenitiesController.amenitiesData.value[index].name!.isEmpty ||
                                                          //                     amenitiesController.amenitiesData.value[index].name == null
                                                          //                 ? Text(
                                                          //                     '24-Hour Front Desk',
                                                          //                     maxLines: 1,
                                                          //                     overflow: TextOverflow.ellipsis,
                                                          //                     style: TextStyle(fontSize: 7),
                                                          //                   )
                                                          //                 : Text(
                                                          //                     '${amenitiesController.amenitiesData.value[index].name}',
                                                          //                     maxLines: 1,
                                                          //                     overflow: TextOverflow.ellipsis,
                                                          //                     style: TextStyle(fontSize: 7),
                                                          //                   ),
                                                          //           )
                                                          //         ],
                                                          //       ),
                                                          //     );
                                                          //   },
                                                          // ),
                                                          SizedBox(height: 10),
                                                          // Text(
                                                          //     'Near by Attractions'),
                                                          // SizedBox(height: 10),
                                                          // Container(
                                                          //   padding: EdgeInsets
                                                          //       .symmetric(
                                                          //           horizontal:
                                                          //               16),
                                                          //   // color: Colors.red,
                                                          //   child: GridView
                                                          //       .builder(
                                                          //     physics:
                                                          //         NeverScrollableScrollPhysics(),
                                                          //     shrinkWrap: true,
                                                          //     gridDelegate:
                                                          //         SliverGridDelegateWithFixedCrossAxisCount(
                                                          //       crossAxisCount:
                                                          //           3,
                                                          //       crossAxisSpacing:
                                                          //           15,
                                                          //       mainAxisSpacing:
                                                          //           5,
                                                          //       mainAxisExtent:
                                                          //           14.h,
                                                          //     ),
                                                          //     itemCount: 6,
                                                          //     itemBuilder:
                                                          //         (BuildContext
                                                          //                 context,
                                                          //             int index) {
                                                          //       return Column(
                                                          //         children: [
                                                          //           Padding(
                                                          //             padding:
                                                          //                 const EdgeInsets.all(
                                                          //                     4),
                                                          //             child: resortController.resortData.value.image ==
                                                          //                     null
                                                          //                 ? Container(
                                                          //                     // width: MediaQuery.of(context).size.width * 0.25,
                                                          //                     height: MediaQuery.of(context).size.height * 0.10,

                                                          //                     decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/imageone.jpg'), fit: BoxFit.cover), color: Colors.amber, borderRadius: BorderRadius.circular(20)),
                                                          //                     // child: Center(child: Text('$index')),
                                                          //                   )
                                                          //                 : Container(
                                                          //                     // width: MediaQuery.of(context).size.width * 0.25,
                                                          //                     height: MediaQuery.of(context).size.height * 0.10,

                                                          //                     decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(Api.imageUrl + '${districtController.districtData.value[index].image}'), fit: BoxFit.cover), color: Colors.amber, borderRadius: BorderRadius.circular(20)),
                                                          //                     // child: Center(child: Text('$index')),
                                                          //                   ),
                                                          //           ),
                                                          //           Padding(
                                                          //             padding: EdgeInsets.only(
                                                          //                 left:
                                                          //                     8),
                                                          //             child:
                                                          //                 Text(
                                                          //               '${districtController.districtData.value[index].name}',
                                                          //               maxLines:
                                                          //                   1,
                                                          //               style:
                                                          //                   TextStyle(
                                                          //                 fontSize:
                                                          //                     10.sp,
                                                          //                 fontWeight:
                                                          //                     FontWeight.w500,
                                                          //                 color:
                                                          //                     Colors.black87,
                                                          //               ),
                                                          //             ),
                                                          //           ),
                                                          //         ],
                                                          //       );
                                                          //     },
                                                          //   ),
                                                          // ),
                                                          SizedBox(height: 20),
                                                        ],
                                                      ),
                                                    ),
                                                    // EducationList(),
                                                    // EducationList(),
                                                    Container(
                                                        color: Color.fromARGB(
                                                            255, 253, 251, 251),
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 16,
                                                                left: 16,
                                                                bottom: 20),
                                                        // color: Colors.red,
                                                        child:
                                                            ListView.separated(
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
                                                                //leading
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

                                                    FutureBuilder<
                                                        HouseBoatGalleryModel>(
                                                      future: futureGallery,
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot.hasData) {
                                                          return Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        16),
                                                            // color: Colors.red,
                                                            child: GridView
                                                                .builder(
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
                                                                    5,
                                                                mainAxisExtent:
                                                                    14.h,
                                                              ),
                                                              itemCount:
                                                                  snapshot
                                                                      .data!
                                                                      .images!
                                                                      .length,
                                                              itemBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      int index) {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(4),
                                                                  child: snapshot
                                                                              .data!
                                                                              .images!
                                                                              .isEmpty ||
                                                                          snapshot.data!.images ==
                                                                              null
                                                                      ? Container(
                                                                          // width: MediaQuery.of(context).size.width * 0.25,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.10,

                                                                          decoration: BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/images/imageone.jpg'), fit: BoxFit.cover),
                                                                              color: Colors.amber,
                                                                              borderRadius: BorderRadius.circular(20)),
                                                                          // child: Center(child: Text('$index')),
                                                                        )
                                                                      : Container(
                                                                          // width: MediaQuery.of(context).size.width * 0.25,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.10,

                                                                          decoration: BoxDecoration(
                                                                              image: DecorationImage(image: NetworkImage(Api.imageUrl + '${snapshot.data!.images![index].image}'), fit: BoxFit.cover),
                                                                              color: Colors.amber,
                                                                              borderRadius: BorderRadius.circular(20)),
                                                                          // child: Center(child: Text('$index')),
                                                                        ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        } else if (snapshot
                                                            .hasError) {
                                                          return Text(
                                                              "${snapshot.error}");
                                                        }
                                                        return CircularProgressIndicator();
                                                      },
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
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
