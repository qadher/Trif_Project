import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';

import '../screens/home/homescreen.dart';

class PromotedPackage extends StatelessWidget {
  final String sectionType;

  PromotedPackage({
    Key? key,
    required this.sectionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int promotedLength = 0;
    List promotedList = [];
    for (int i = 0; i < promotedPackageController.promotedPackageData.value.length; i++) {
      if (promotedPackageController.promotedPackageData.value[i].type == '$sectionType') {
        promotedLength += 1;
        promotedList.add(promotedPackageController.promotedPackageData.value[i]);
      }
    }

    return Obx(() {
      if (promotedPackageController.isLoading.value) {
        return CircularProgressIndicator();
      } else {
        return Container(
            height: 20.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: promotedList.length,
              options: CarouselOptions(autoPlay: true, aspectRatio: 2.0, enlargeCenterPage: false, viewportFraction: 1
                  // viewportFraction: 1,
                  ),
              itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                  // promotedPackageController.promotedPackageData.value[promotedList[index]].type == '$sectionType'
                  promotedList.length == 0
                      ? Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/no_image/noimage_landscape.jpeg',
                                  ),
                                  fit: BoxFit.cover)),
                        )
                      : promotedList[index].type == '$sectionType'
                          ? GestureDetector(
                              onTap: () {
                                // Get.toNamed('/promotedsinglepage', arguments: [
                                //   promotedPackageController.promotedPackageData.value[promotedList[index]].district,
                                //   promotedPackageController.promotedPackageData.value[promotedList[index]].image,
                                //   promotedPackageController.promotedPackageData.value[promotedList[index]].amount,
                                //   promotedPackageController.promotedPackageData.value[promotedList[index]].days,
                                //   promotedPackageController,
                                //   promotedPackageController.promotedPackageData.value[promotedList[index]].type,
                                //   promotedPackageController.promotedPackageData.value[promotedList[index]].id,
                                // ]);
                                Get.toNamed('/promotedsinglepage', arguments: [
                                  promotedList[index].district,
                                  promotedList[index].image,
                                  promotedList[index].amount,
                                  promotedList[index].days,
                                  promotedPackageController,
                                  promotedList[index].type,
                                  promotedList[index].id,
                                  promotedList[index].agencyId,
                                ]);
                              },
                              child: Container(
                                margin: EdgeInsets.all(5.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    child: Container(
                                      color: Color.fromARGB(255, 192, 192, 192),
                                      child: Stack(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: promotedPackageController.promotedPackageData.value[index].image!.isEmpty ||
                                                    promotedPackageController.promotedPackageData.value[index].image == null
                                                ? Image.asset('assets/images/no_image/noimage_landscape.jpeg',
                                                    fit: BoxFit.cover, width: 1000.0)
                                                : CachedNetworkImage(
                                                    imageUrl: Api.imageUrl +
                                                        '${promotedPackageController.promotedPackageData.value[index].image}',
                                                    fit: BoxFit.cover,
                                                    width: 1000,
                                                  ),
                                          ),

                                          // Image.network(
                                          //     Api.imageUrl +
                                          //         '${promotedPackageController.promotedPackageData.value[index].image}',
                                          //     fit: BoxFit.cover,
                                          //     width: 1000.0),
                                          Positioned(
                                              top: 0,
                                              child: Container(
                                                // width: 60.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                ),

                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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
                            )
                          : Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/no_image/noimage_landscape.jpeg',
                                  ),
                                  fit: BoxFit.cover)),
                        )
            ));
      }
    });
  }
}
