import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/screens/home/components/titletext.dart';

import '../../../controllers/houseboatapicardcontroller.dart';

class HouseBoatPackageCard extends StatelessWidget {
  final HouseboatApiCardController controller =
      Get.put(HouseboatApiCardController());

  HouseBoatPackageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.houseBoatData.value.length,
              separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),

                      child: Row(
                        children: [
                          controller.houseBoatData.value[index].image!
                                      .isEmpty ||
                                  controller.houseBoatData.value[index].image ==
                                      null
                              ? Container(
                                  height: 135.h,
                                  width: 135.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topLeft: Radius.circular(15)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/imageone.jpg'),
                                      fit: BoxFit.cover,

                                      // NetworkImage(Api.imageUrl + '${controller.houseBoatData.value[index].image}'),
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 135.h,
                                  width: 135.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topLeft: Radius.circular(15)),
                                    image: DecorationImage(
                                      image: NetworkImage(Api.imageUrl +
                                          '${controller.houseBoatData.value[index].image}'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          // Container(
                          //   height: 135.h,
                          //   width: 135.w,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.only(
                          //         bottomLeft: Radius.circular(15),
                          //         topLeft: Radius.circular(15)),
                          //     image: DecorationImage(
                          //       image: NetworkImage(Api.imageUrl + '${controller.houseBoatData.value[index].image}'),
                          //       fit: BoxFit.cover,

                          //     // NetworkImage(Api.imageUrl + '${controller.houseBoatData.value[index].image}'),
                          //       // fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w, top: 10.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 190.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.houseBoatData.value[index].name}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lato',
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_pin,
                                            size: 18,
                                            color: Color(0xFF00A6F6),
                                          ),
                                          Text(
                                            '${controller.houseBoatData.value[index].district}',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 12.h),
                                            child: Text(
                                              'Verified',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Lato',
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '${controller.houseBoatData.value[index].advAmount}%Off',
                                                style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFFF6B100)),
                                              ),
                                              Text(
                                                '₹${controller.houseBoatData.value[index].offerAmount}',
                                                style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF00A6F6)),
                                              ),
                                              Text(
                                                '₹${controller.houseBoatData.value[index].budget}/-',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16.sp,
                                                    fontFamily: 'Lato',
                                                    // line text
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
        }
      },
    );
  }
}
