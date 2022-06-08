import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';

import '../../../controllers/attractionapicardcontroller.dart';

class TrendingNow extends StatelessWidget {
  final AttractionApiCardController controller = Get.put(AttractionApiCardController());
  TrendingNow({Key? key}) : super(key: key);

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
            itemCount: controller.attractionData.value.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Get.toNamed(
                  '/attractionsinglepage',
                  arguments: [
                    controller.attractionData.value[index].id,
                  ],
                ),
                child: Padding(
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
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0xFFAEAEAE)),
                      ),
                      Container(
                        //background image
                        height: 16.h,
                        width: 32.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: controller.attractionData.value[index].image!.isEmpty ||
                                    controller.attractionData.value[index].image == null
                                ? Image.asset(
                                    'assets/images/no_image/noimage_square.jpeg',
                                    fit: BoxFit.cover,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: Api.imageUrl + '${controller.attractionData.value[index].image!}',
                                    fit: BoxFit.cover,
                                  )),
                      ),
                      Positioned(
                        top: 6.h,
                        left: 0,
                        child: Container(
                          width: 25.w,
                          decoration: BoxDecoration(
                            color: Color(0xFFF6B100),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                            child: Text(
                              controller.attractionData.value[index].name!.substring(0, 1).toUpperCase() +
                                  controller.attractionData.value[index].name!.substring(1).toLowerCase().split(' ')[0],
                              maxLines: 1,
                              style: TextStyle(fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
