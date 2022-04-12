import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';

import '../../../controllers/packageapicardcontroller.dart';
import '../../../controllers/resortapicardcontroller.dart';

final PackageApiCardController promotedPackageController =
    Get.put(PackageApiCardController());
final ResortApiCardController nearbyPackageController =
    Get.put(ResortApiCardController());

final List<String> images = [
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
  'assets/images/imageone.jpg',
];

final List<String> imgList = [
  '${nearbyPackageController.resortData.value[0].image}',
  '${nearbyPackageController.resortData.value[1].image}',
  '${nearbyPackageController.resortData.value[2].image}',
];

final List<String> imgListInner = [
  '${promotedPackageController.packageData.value[0].image}',
  '${promotedPackageController.packageData.value[1].image}',
  '${promotedPackageController.packageData.value[2].image}',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/singlepage', arguments: [
                      nearbyPackageController
                          .resortData.value[imgList.indexOf(item)],
                      nearbyPackageController,
                      nearbyPackageController
                          .resortData.value[imgList.indexOf(item)].image,
                      nearbyPackageController
                          .resortData.value[imgList.indexOf(item)].name,
                      nearbyPackageController
                          .resortData.value[imgList.indexOf(item)].avgAmount,
                      nearbyPackageController
                          .resortData.value[imgList.indexOf(item)].name,
                    ]);
                  },
                  child: Stack(
                    children: <Widget>[
                      Image.network(Api.imageUrl + item,
                          fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(color: Colors.white),
                          child: Center(
                            child: Text(
                              '${nearbyPackageController.resortData.value[imgList.indexOf(item)].name} ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ))
    .toList();

final List<Widget> imageSlidersBanner = imgListInner
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/singlepage', arguments: [
                      promotedPackageController
                          .packageData.value[imgListInner.indexOf(item)],
                      promotedPackageController,
                      promotedPackageController
                          .packageData.value[imgListInner.indexOf(item)].image,
                      promotedPackageController
                          .packageData.value[imgListInner.indexOf(item)].name,
                      promotedPackageController.packageData
                          .value[imgListInner.indexOf(item)].avgAmount,
                      promotedPackageController
                          .packageData.value[imgListInner.indexOf(item)].name,
                    ]);
                  },
                  child: Stack(
                    children: <Widget>[
                      Image.network(Api.imageUrl + item,
                          fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                          top: 0,
                          child: Container(
                            // width: 60.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Text('Promoted',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Lato',
                                  )),
                            ),
                          ))
                    ],
                  ),
                )),
          ),
        ))
    .toList();
