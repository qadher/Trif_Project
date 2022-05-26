import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/resortapicardcontroller.dart';

import '../../../controllers/attractionapicardcontroller.dart';

class NearbyPlaces extends StatelessWidget {
  final ResortApiCardController controller = Get.put(ResortApiCardController());
  NearbyPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      child: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.resortData.value.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 18.h,
                      width: 28.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFDCDCDC),
                      ),
                    ),
                    Container(
                      height: 17.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFAEAEAE)),
                    ),
                    controller.resortData.value[index].image!.isEmpty ||
                          controller.resortData.value[index].image == null
                      ? Container(
                      //background image
                      height: 16.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/no_image/noimage_square.jpeg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                      : Container(
                      //background image
                      height: 16.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            Api.imageUrl +
                                '${controller.resortData.value[index].image!}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 6.h,
                      left: 0,
                      child: Container(
                        width: 25.w,
                        decoration: BoxDecoration(
                          color: Color(0xFFF6B100),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 3),
                          child: Text(
                            controller.resortData.value[index].name!
                                    .substring(0, 1)
                                    .toUpperCase() +
                                controller.resortData.value[index].name!
                                    .substring(1)
                                    .toLowerCase()
                                    .split(' ')[0],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 4);
            },
          );
        }
      }),
    );
  }
}
