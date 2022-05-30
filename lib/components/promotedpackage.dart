import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';

import '../controllers/promotedpackagesapicontroller.dart';
import '../screens/home/homescreen.dart';

class PromotedPackage extends StatelessWidget {
  final String sectionType;
  PromotedPackage({
    Key? key,
    required this.sectionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (promotedPackageController.isLoading.value) {
        return CircularProgressIndicator();
      } else {
        return Container(
            height: 20.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: 3,
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: false,
                  viewportFraction: 1
                  // viewportFraction: 1,
                  ),
              itemBuilder: (BuildContext context, int index,
                      int pageViewIndex) =>
                  promotedPackageController
                              .promotedPackageData.value[index].type ==
                          '$sectionType'
                      ? GestureDetector(
                          onTap: () {
                            Get.toNamed('/promotedsinglepage', arguments: [
                              promotedPackageController
                                  .promotedPackageData.value[index].district,
                              promotedPackageController
                                  .promotedPackageData.value[index].image,
                              promotedPackageController
                                  .promotedPackageData.value[index].amount,
                              promotedPackageController
                                  .promotedPackageData.value[index].days,
                              promotedPackageController,
                              promotedPackageController
                                  .promotedPackageData.value[index].type,
                              promotedPackageController
                                  .promotedPackageData.value[index].id,
                            ]);
                          },
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Container(
                                  color: Color.fromARGB(255, 192, 192, 192),
                                  child: Stack(
                                    children: <Widget>[
                                      promotedPackageController
                                                  .promotedPackageData
                                                  .value[index]
                                                  .image!
                                                  .isEmpty ||
                                              promotedPackageController
                                                      .promotedPackageData
                                                      .value[index]
                                                      .image ==
                                                  null
                                          ? Image.asset(
                                              'assets/images/no_image/noimage_landscape.jpeg',
                                              fit: BoxFit.cover,
                                              width: 1000.0)
                                          : Image.network(
                                              Api.imageUrl +
                                                  '${promotedPackageController.promotedPackageData.value[index].image}',
                                              fit: BoxFit.cover,
                                              width: 1000.0),
                                      Positioned(
                                          top: 0,
                                          child: Container(
                                            // width: 60.w,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                            ),

                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 2),
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
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                  color: Color.fromARGB(255, 192, 192, 192),
                                  child: Image.asset(
                                      'assets/images/no_image/noimage_landscape.jpeg',
                                      fit: BoxFit.cover,
                                      width: 1000.0))),
                        ),
            ));
      }
    });
  }
}
