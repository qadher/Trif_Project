import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/components/vodcast_tile.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/screens/home/attractionsinglepage/attractionsinglepagemodel.dart';
import 'package:trip_calicut/screens/home/homesinglepage/packagesinglepagemodel.dart';
import 'package:trip_calicut/screens/houseboat/singlepage/package/model/houseboatgallerymodel.dart';
import 'package:trip_calicut/screens/houseboat/singlepage/package/model/houseboatpackagemodel.dart';
import 'package:http/http.dart' as http;
import 'package:trip_calicut/screens/resort/singlepage/resortAmenitiesmodel.dart';
import 'package:trip_calicut/screens/resort/singlepage/resortsinglepagemodel.dart';
import 'package:trip_calicut/screens/resort/singlepage/superdeluxroommodel.dart';

import '../../../hive/controller/db_controller.dart';
import '../../../hive/database/model/db_model.dart';
import '../../../services/apiservice.dart';
import '../../houseboat/singlepage/package/model/houseboatvideosmodel.dart';
import '../../jobs/components/FixedBottomSwitch.dart';
import '../../player_screen/player.dart';
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

Future<HouseBoatVideosModel> fetchVideos(int id) async {
  final response =
      await http.post(Uri.parse(Api.apiUrl + 'resorts/videos/$id'));

// Appropriate action depending upon the
// server response
  if (response.statusCode == 200) {
    return HouseBoatVideosModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class ResortSinglePagePackage extends StatefulWidget {
  ResortSinglePagePackage({Key? key}) : super(key: key);

  @override
  _ResortSinglePagePackageState createState() =>
      _ResortSinglePagePackageState();
}

class _ResortSinglePagePackageState extends State<ResortSinglePagePackage> {
  Future<ResortSinglePageModel>? futurePackage;
  Future<HouseBoatGalleryModel>? futureGallery;
  Future<HouseBoatVideosModel>? futureVideos;
  Future<ResortAmenitiesModel>? futureAmenities;
  Future<SuperDeluxRoomModel>? futureRooms;
  final DbController = Get.put(DBController());
  IconData? icon;

  @override
  void initState() {
    super.initState();
    futurePackage = fetchSinglePage(itemId);
    futureGallery = fetchGallery(itemId);
    futureVideos = fetchVideos(itemId);
  }

  int itemId = Get.arguments[0];
  final String _type = 'resort';
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<ResortSinglePageModel>(
            future: futurePackage,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                name = snapshot.data!.resort!.name!;
                icon =
                    DbController.updateIcon(name: snapshot.data!.resort!.name!);
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
                                              InkWell(
                                                onTap: () async {
                                                  await DbController.updateFav(
                                                    name: snapshot
                                                        .data!.resort!.name
                                                        .toString(),
                                                    item: TrifsDB(
                                                        id: itemId,
                                                        type: _type,
                                                        image: snapshot
                                                            .data!.resort!.image!,
                                                        title: snapshot
                                                            .data!.resort!.name
                                                            .toString(),
                                                        desc: snapshot
                                                            .data!.resort!.foodDesc,
                                                        fav: true),
                                                  );
                                                  // final data = RepositoryBox.getBox();
                                                  // print(DbController.observableBox.values.toList());
                                                  // print(DbController.observableBox.length);
                                                  // print(itemId);
                                                  // print(_type);
                                                  // print(snapshot.data!.resort!.image!);
                                                  // print(snapshot.data!.resort!.name.toString());
                                                  DbController.updateIcon(
                                                      name: snapshot
                                                          .data!.resort!.name!);
                                                  setState(() {});
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
                                                      FutureBuilder<
                                                          HouseBoatVideosModel>(
                                                        future: futureVideos,
                                                        builder:
                                                            (context, snapshot) {
                                                          if (snapshot.hasData) {
                                                         
                                                            return Container(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        253,
                                                                        251,
                                                                        251),
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: 16,
                                                                        left: 16,
                                                                        bottom:
                                                                            20),
                                                                // color: Colors.red,
                                                                child: ListView
                                                                    .separated(
                                                                  separatorBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  itemCount: snapshot.data!.videos!.length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                            // _fetchMetadata(snapshot.data!.videos![index].url!);
                                                                            //  MetaDataModel metaData = await YoutubeMetaData.getData(snapshot.data!.videos![index].url!);
                                                                    return GestureDetector(
                                                                      onTap: () {
                                                                        // print(metaData!.authorName);
                                                                        print(
                                                                            '${snapshot.data!.videos![index].url}');
                                                                            Get.to(PLayerScreen(url: snapshot.data!.videos![index].url!));
                                                                      },
                                                                      child: VodcastTile(name: name, index: index,
                                                          ),
                                                                    
                                                                    );
                                                                  },
                                                                ));
                                                          } else if (snapshot
                                                              .hasError) {
                                                            return Text(
                                                                "${snapshot.error}");
                                                          }
                                                          return Center(child: CircularProgressIndicator());
                                                        },
                                                      ),
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
                                                                        : GestureDetector(
                                                                          onTap: () => Get.toNamed('/fullscreenimage', arguments: snapshot.data!.images![index].image),
                                                                          child: Container(
                                                                              // width: MediaQuery.of(context).size.width * 0.25,
                                                                              height:
                                                                                  MediaQuery.of(context).size.height * 0.10,
                                                                              
                                                                              decoration: BoxDecoration(
                                                                                  image: DecorationImage(image: NetworkImage(Api.imageUrl + '${snapshot.data!.images![index].image}'), fit: BoxFit.cover),
                                                                                  color: Colors.amber,
                                                                                  borderRadius: BorderRadius.circular(20)),
                                                                              // child: Center(child: Text('$index')),
                                                                            ),
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
                                                          return Center(child: CircularProgressIndicator());
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
                    // FixedBottomSwitch(),
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
                                    type: 'Enquiry',
                                    packageType: 'Resort',
                                    packageId: '${snapshot.data!.resort!.id}',
                                    agencyId:
                                        '${snapshot.data!.resort!.agencyId}',
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
                                onTap: () async {
                                  enquiryMethod(
                                      type: 'Call',
                                      packageType: 'Resort',
                                      packageId:
                                          '${snapshot.data!.resort!.id}',
                                      agencyId:
                                          '${snapshot.data!.resort!.agencyId}',
                                      customerId: '111');
                                  // _callNumber();
                                  // bool? res = await FlutterPhoneDirectCaller.callNumber('${snapshot.data!.agency!.mobile}');
                                  bool? res =
                                      await FlutterPhoneDirectCaller.callNumber(
                                          '6238265477');
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
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
