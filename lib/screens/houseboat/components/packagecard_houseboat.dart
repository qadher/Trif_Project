import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/houseboatapicardcontroller.dart';

import '../../home/components/titletext.dart';

class RecommendedPackageCardHouseBoat extends StatelessWidget {
  final HouseboatApiCardController controller =
      Get.put(HouseboatApiCardController());

  RecommendedPackageCardHouseBoat({
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
          return Container(
            height: 28.7.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.houseBoatData.value.length,
              separatorBuilder: (context, index) => SizedBox(
                  //width: 4.w,
                  ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // print(Api.imageUrl + '${controller.houseBoatData.value[index].image}');
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          controller.houseBoatData.value[index].image!
                                      .isEmpty ||
                                  controller.houseBoatData.value[index].image ==
                                      null
                              ? Container(
                                  height: 19.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/imageone.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 19.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(Api.imageUrl +
                                          '${controller.houseBoatData.value[index].image}'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                          // Container(
                          //   height: 125.h,
                          //   width: 232.w,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(15),
                          //     image: DecorationImage(
                          //       image: NetworkImage(Api.imageUrl + '${controller.houseBoatData.value[index].image}'),
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 60.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.houseBoatData.value[index].name!.substring(0, 1).toUpperCase() + controller.houseBoatData.value[index].name!.substring(1).toLowerCase().split(' ')[0]}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 18,
                                          color: Color(0xFF00A6F6),
                                        ),
                                        Text(
                                          '${controller.houseBoatData.value[index].country}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.green,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '₹${controller.houseBoatData.value[index].budget}',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF00A6F6)),
                                    ),
                                    Text(
                                      '₹${controller.houseBoatData.value[index].offerAmount}',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontFamily: 'Lato',
                                          // line text
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${controller.houseBoatData.value[index].advAmount}%Off',
                                      style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFF6B100)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

class PackageCardHouseBoat extends StatelessWidget {
  const PackageCardHouseBoat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            height: 120,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage('assets/images/imageone.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 210,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(text: 'River Woods'),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 18,
                          color: Color(0xFF00A6F6),
                        ),
                        Text(
                          'Canada',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '₹2000',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00A6F6)),
                    ),
                    Text(
                      '₹2500',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: 'Lato',
                          // line text
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '20%Off',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF6B100)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
