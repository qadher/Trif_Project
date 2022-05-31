import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/screens/houseboat/singlepage/package/model/houseboatgallerymodel.dart';
import 'package:trip_calicut/screens/houseboat/singlepage/package/model/houseboatpackagemodel.dart';
import 'package:http/http.dart' as http;
import 'package:trip_calicut/screens/houseboat/singlepage/package/model/houseboatvideosmodel.dart';
import 'package:trip_calicut/screens/player_screen/player.dart';

import '../../../../components/vodcast_tile.dart';
import '../../../../hive/Repository/repository.dart';
import '../../../../hive/controller/db_controller.dart';
import '../../../../hive/database/model/db_model.dart';
import '../../../../services/apiservice.dart';
import '../../../../widgets.dart';
import '../../../tours/components/fixed_top_navigatio.dart';

Future<HouseBoatPackageModel> fetchSinglePage(int id) async {
  final response = await http.post(Uri.parse(Api.apiUrl + 'houseboat/$id'));

// Appropriate action depending upon the

// server response
  if (response.statusCode == 200) {
    return HouseBoatPackageModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<HouseBoatGalleryModel> fetchGallery(int id) async {
  final response =
      await http.post(Uri.parse(Api.apiUrl + 'houseboat/gallery/$id'));

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
      await http.post(Uri.parse(Api.apiUrl + 'houseboat/videos/$id'));

// Appropriate action depending upon the
// server response
  if (response.statusCode == 200) {
    return HouseBoatVideosModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
//   MetaDataModel? metaData;
// void _fetchMetadata(String link) async {
//     // print(widget.url);
//     print("+++++++++===============$link");
   
//       metaData = await YoutubeMetaData.getData(link);
  
//   }

class HouseBoatPackageSinglePage extends StatefulWidget {
  HouseBoatPackageSinglePage({Key? key}) : super(key: key);

  @override
  _HouseBoatPackageSinglePageState createState() =>
      _HouseBoatPackageSinglePageState();
}

class _HouseBoatPackageSinglePageState
    extends State<HouseBoatPackageSinglePage> {
  Future<HouseBoatPackageModel>? futurePackage;
  Future<HouseBoatGalleryModel>? futureGallery;
  Future<HouseBoatVideosModel>? futureVideos;
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
  final String _type = 'houseboat';
   String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<HouseBoatPackageModel>(
          future: futurePackage,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              name = snapshot.data!.houseboats!.name!;
              icon = DbController.updateIcon(
                  name: snapshot.data!.houseboats!.name!);
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
                                  snapshot.data!.houseboats!.image!.isEmpty ||
                                          snapshot.data!.houseboats!.image ==
                                              null
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
                                                          snapshot.data!
                                                              .houseboats!.image
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
                                                    snapshot
                                                        .data!.houseboats!.name
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
                                                  snapshot.data!.houseboats!
                                                              .district ==
                                                          null
                                                      ? 'Kerala'
                                                      : "${snapshot.data!.houseboats!.district},${snapshot.data!.houseboats!.state},${snapshot.data!.houseboats!.country}",
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
                                                      .data!.houseboats!.name
                                                      .toString(),
                                                  item: TrifsDB(
                                                      id: itemId,
                                                      type: _type,
                                                      image: snapshot.data!
                                                          .houseboats!.image!,
                                                      title: snapshot.data!
                                                          .houseboats!.name
                                                          .toString(),
                                                      desc: snapshot
                                                          .data!
                                                          .houseboats!
                                                          .description,
                                                      fav: true),
                                                );
                                                final data =
                                                    RepositoryBox.getBox();
                                                print(DbController
                                                    .observableBox.values
                                                    .toList());
                                                print(DbController
                                                    .observableBox.length);
                                                print(itemId);
                                                print(_type);
                                                print(snapshot
                                                    .data!.houseboats!.image!);
                                                print(snapshot
                                                    .data!.houseboats!.name
                                                    .toString());
                                                DbController.updateIcon(
                                                    name: snapshot.data!
                                                        .houseboats!.name!);
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
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Price Starts from ₹${snapshot.data!.houseboats!.offerAmount}/-',
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
                                                                  '${snapshot.data!.houseboats!.description}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13),
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Text(
                                                                  '${snapshot.data!.houseboats!.days}',
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
                                                    //Videos List
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
                                                                    //     Container(
                                                                    //   decoration:
                                                                    //       BoxDecoration(
                                                                    //     color: Color.fromARGB(
                                                                    //         255,
                                                                    //         236,
                                                                    //         235,
                                                                    //         235),
                                                                    //     borderRadius:
                                                                    //         BorderRadius.circular(5),
                                                                    //   ),
                                                                    //   padding:
                                                                    //       EdgeInsets.all(
                                                                    //           4),
                                                                    //   child:
                                                                    //       // VodcastTile(),
                                                                    //       Row(
                                                                    //     children: [
                                                                    //       Stack(
                                                                    //         children: [
                                                                    //           Container(
                                                                    //             height: 8.h,
                                                                    //             width: 28.w,
                                                                    //             decoration: BoxDecoration(
                                                                    //                 borderRadius: BorderRadius.circular(5),
                                                                    //                 image: DecorationImage(
                                                                    //                     fit: BoxFit.cover,
                                                                    //                     image: AssetImage(
                                                                    //                       'assets/images/no_image/noimage_landscape.jpeg',
                                                                    //                     ))),
                                                                    //           ),
                                                                    //           Positioned(
                                                                    //             left: 0,
                                                                    //             right: 0,
                                                                    //             top: 0,
                                                                    //             bottom: 0,
                                                                    //             child: Icon(
                                                                    //               Icons.play_circle_outline,
                                                                    //               size: 28,
                                                                    //               color: Colors.black.withOpacity(0.5),
                                                                    //             ),
                                                                    //           ),
                                                                    //         ],
                                                                    //       ),
                                                                    //       widthSizedBox(),
                                                                    //       Flexible(
                                                                    //         child:
                                                                    //             Text(
                                                                    //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehen',
                                                                    //           overflow: TextOverflow.ellipsis,
                                                                    //           maxLines: 3,
                                                                    //           style: TextStyle(fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.w500),
                                                                    //         ),
                                                                    //       ),
                                                                    //     ],
                                                                    //   ),
                                                                    // ),
                                                                  );
                                                                },
                                                              ));
                                                        } else if (snapshot
                                                            .hasError) {
                                                          return Text(
                                                              "${snapshot.error}");
                                                        }
                                                        return CircularProgressIndicator();
                                                      },
                                                    ),

                                                    // EducationList(),
                                                    //Gallery List

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
                  // FixedBottomSwitchHouseBoat(),
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
                                  packageType: 'HouseBoats',
                                  packageId: '${snapshot.data!.houseboats!.id}',
                                  agencyId:
                                      '${snapshot.data!.houseboats!.agencyId}',
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

                              // EnquiryResponseModel model = EnquiryResponseModel(
                              // user_id: '626f9cb57cc72973074f8f78',
                              // job_designation: 'asus',
                              // job_desc: 'asus',
                              // category: 'asus',
                              // province: 'asus',
                              // city: 'asus',
                              // minimum_pay: 'asus',
                              // from: '2822-04-12T00:00:00.0002',
                              // to: '2022-05-07T00:00:00.0002',
                              // skills: 'asus'
                              // type: 'Enquiry',
                              // package_type: 'HouseBoats',

                              // );
                              // ApiService.fetchEnquiryData(type: model.type).then((value) {
                              //   print(value);
                              // });

                              // ApiService.postEnquiry(model).then((value) {
                              //   print(value);
                              //   if (value.status == '200') {
                              //     showDialog(
                              //         context: context,
                              //         builder: (BuildContext context) {
                              //           return AlertDialog(
                              //             title: Text('Success'),
                              //             content: Text(
                              //                 'Your enquiry has been sent successfully'),
                              //             actions: <Widget>[
                              //               FlatButton(
                              //                 child: Text('OK'),
                              //                 onPressed: () {
                              //                   Navigator.of(context).pop();
                              //                 },
                              //               )
                              //             ],
                              //           );
                              //         });
                              //   } else {
                              //     showDialog(
                              //         context: context,
                              //         builder: (BuildContext context) {
                              //           return AlertDialog(
                              //             title: Text('Error'),
                              //             content: Text(
                              //                 'Something went wrong, please try again'),
                              //             actions: <Widget>[
                              //               FlatButton(
                              //                 child: Text('OK'),
                              //                 onPressed: () {
                              //                   Navigator.of(context).pop();
                              //                 },
                              //               )
                              //             ],
                              //           );
                              //         });
                              //   }
                              // });
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
                                    packageType: 'HouseBoats',
                                    packageId:
                                        '${snapshot.data!.houseboats!.id}',
                                    agencyId:
                                        '${snapshot.data!.houseboats!.agencyId}',
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
    );
  }
}
