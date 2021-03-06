import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/components/vodcast_tile.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/screens/houseboat/singlepage/package/model/houseboatgallerymodel.dart';
import 'package:http/http.dart' as http;
import 'package:trip_calicut/screens/tours/singlepage/toursinglepagemodel.dart';

import '../../../hive/Repository/repository.dart';
import '../../../hive/controller/db_controller.dart';
import '../../../hive/database/model/db_model.dart';
import '../../jobs/components/FixedBottomSwitch.dart';
import '../components/fixed_top_navigatio.dart';


Future<TourSinglePageModel> fetchSinglePage(int id) async {
  final response = await http.post(Uri.parse(Api.apiUrl + 'places/$id'));

// Appropriate action depending upon the

// server response
  if (response.statusCode == 200) {
    return TourSinglePageModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<HouseBoatGalleryModel> fetchGallery(int id) async {
  final response = await http.post(Uri.parse(Api.apiUrl + 'places/gallery/$id'));

// Appropriate action depending upon the
// server response
  if (response.statusCode == 200) {
    return HouseBoatGalleryModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class TourSinglePagePackage extends StatefulWidget {
  TourSinglePagePackage({Key? key}) : super(key: key);

  @override
  _TourSinglePagePackageState createState() => _TourSinglePagePackageState();
}

class _TourSinglePagePackageState extends State<TourSinglePagePackage> {
  Future<TourSinglePageModel>? futuretour;
  Future<HouseBoatGalleryModel>? futureGallery;
  final DbController = Get.put(DBController());
  IconData? icon;

  @override
  void initState() {
    super.initState();
    futuretour = fetchSinglePage(itemId);
    futureGallery = fetchGallery(itemId);
  }

  int itemId = Get.arguments[0];
  final String _type = 'places';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<TourSinglePageModel>(
          future: futuretour,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              icon = DbController.updateIcon(name: snapshot.data!.place!.name!);
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
                                  snapshot.data!.place!.image!.isEmpty || snapshot.data!.place!.image == null
                                      ? Container(
                                          height: 500,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
                                                  image: AssetImage('assets/images/no_image/noimage_square.jpeg'),
                                                  fit: BoxFit.cover),
                                              color: Colors.black),
                                              
                                        )
                                      : Container(
                                          height: 500,
                                          decoration: BoxDecoration(color: Colors.grey),
                                          child: CachedNetworkImage(
                                              imageUrl: Api.imageUrl + snapshot.data!.place!.image.toString(), fit: BoxFit.cover),
                                        ),
                                  Positioned(
                                      bottom: 75,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 18),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.80,
                                                  child: Text(
                                                    //first letter caps and rest lower
                                                    //split with two words
                                                    snapshot.data!.place!.name.toString(),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,

                                                    //     .substring(0, 1)
                                                    //     .toUpperCase() +
                                                    // controller.packageData.value.name!
                                                    //     .substring(1)
                                                    //     .toLowerCase(),
                                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
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
                                                  name: snapshot.data!.place!.name.toString(),
                                                  item: TrifsDB(
                                                      id: itemId,
                                                      type: _type,
                                                      image: snapshot.data!.place!.image!,
                                                      title: snapshot.data!.place!.name.toString(),
                                                      desc: snapshot.data!.place!.desc,
                                                      fav: true),
                                                );
                                                final data = RepositoryBox.getBox();
                                                // print(DbController.observableBox.values.toList());
                                                // print(DbController.observableBox.length);
                                                // print(itemId);
                                                // print(_type);
                                                // print(snapshot.data!.houseboats!.image!);
                                                // print(snapshot.data!.houseboats!.name.toString());
                                                DbController.updateIcon(name: snapshot.data!.place!.name!);
                                                setState(() {});
                                                // DbController.observableBox.clear();
                                              },
                                              child: Icon(
                                                icon,
                                                size: 30,
                                                color: Color.fromARGB(255, 160, 14, 14),
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
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          child: Text(
                                            '${snapshot.data!.place!.desc}',
                                            style: TextStyle(
                                                fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 146, 144, 144)),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xff00A6F6),
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
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
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                                                padding: const EdgeInsets.only(top: 4, right: 8, left: 8, bottom: 8),
                                                child: Container(
                                                  height: 40,
                                                  // width: 95,
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
                                                    labelStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                    unselectedLabelStyle: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                    indicator: BoxDecoration(
                                                      color: Color(0xffE5E5E5),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    // isScrollable: true,
                                                    labelColor: Colors.black,
                                                    unselectedLabelColor: Colors.black,
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
                                                  maxHeight: MediaQuery.of(context).size.height * 0.50,
                                                  minHeight: MediaQuery.of(context).size.height * 0.50,
                                                ),
                                                child: TabBarView(
                                                  children: <Widget>[
                                                    SingleChildScrollView(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(height: 10),
                                                            Text(
                                                              '${snapshot.data!.place!.history}',
                                                              style: TextStyle(fontSize: 13),
                                                            ),
                                                            SizedBox(height: 30),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // EducationList(),
                                                    // EducationList(),
                                                    //Videos
                                                    Container(),
                                                    // EducationList(),

                                                    FutureBuilder<HouseBoatGalleryModel>(
                                                      future: futureGallery,
                                                      builder: (context, snapshot) {
                                                        if (snapshot.hasData) {
                                                          return Container(
                                                            padding: EdgeInsets.symmetric(horizontal: 16),
                                                            // color: Colors.red,
                                                            child: GridView.builder(
                                                              physics: NeverScrollableScrollPhysics(),
                                                              shrinkWrap: true,
                                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount: 3,
                                                                crossAxisSpacing: 15,
                                                                mainAxisSpacing: 5,
                                                                mainAxisExtent: 14.h,
                                                              ),
                                                              itemCount: snapshot.data!.images!.length,
                                                              itemBuilder: (BuildContext context, int index) {
                                                                return Padding(
                                                                  padding: const EdgeInsets.all(4),
                                                                  child: snapshot.data!.images!.isEmpty || snapshot.data!.images == null
                                                                      ? Container(
                                                                          // width: MediaQuery.of(context).size.width * 0.25,
                                                                          height: MediaQuery.of(context).size.height * 0.10,

                                                                          decoration: BoxDecoration(
                                                                              image: DecorationImage(
                                                                                  image: AssetImage(
                                                                                      'assets/images/no_image/noimage_square.jpeg'),
                                                                                  fit: BoxFit.cover),
                                                                              color: Colors.amber,
                                                                              borderRadius: BorderRadius.circular(20)),
                                                                          // child: Center(child: Text('$index')),
                                                                        )
                                                                      : Container(
                                                                          // width: MediaQuery.of(context).size.width * 0.25,
                                                                          height: MediaQuery.of(context).size.height * 0.10,

                                                                          decoration: BoxDecoration(
                                                                              image: DecorationImage(
                                                                                  image: NetworkImage(Api.imageUrl +
                                                                                      '${snapshot.data!.images![index].image}'),
                                                                                  fit: BoxFit.cover),
                                                                              color: Colors.amber,
                                                                              borderRadius: BorderRadius.circular(20)),
                                                                          // child: Center(child: Text('$index')),
                                                                        ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        } else if (snapshot.hasError) {
                                                          return Text("${snapshot.error}");
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
