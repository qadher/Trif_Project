import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';

import '../../../controllers/houseboatapicardcontroller.dart';

class HouseBoatPackageCard extends StatelessWidget {
  final HouseboatApiCardController controller = Get.put(HouseboatApiCardController());

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
              //itemCount if district == Alappuzha then show only Alappuzha
              // itemCount: controller.houseBoatData.value
              //     .where((element) => element.district == 'Alapuzha')
              //     .length,
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        '/houseboatpackagesinglepage',
                        arguments: [
                          controller.houseBoatData.value[index].id,
                        ],
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        // padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),

                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 135,
                          child: Row(
                            children: [
                              Container(
                                  height: MediaQuery.of(context).size.height * 0.25,
                                  child: Container(
                                    // height: 135,
                                    // width: 135,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)),
                                      child: controller.houseBoatData.value[index].image!.isEmpty ||
                                              controller.houseBoatData.value[index].image == null
                                          ? Image.asset(
                                              'assets/images/no_image/noimage_square.jpeg',
                                              fit: BoxFit.cover,
                                            )
                                          : CachedNetworkImage(
                                              imageUrl: Api.imageUrl + '${controller.houseBoatData.value[index].image!}',
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.houseBoatData.value[index].name}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lato',
                                          color: Colors.black.withOpacity(0.5)),
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
                                          style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5), fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Verified',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Lato',
                                                color: Colors.black.withOpacity(0.5)),
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '${controller.houseBoatData.value[index].advAmount}%Off',
                                                style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFFF6B100)),
                                              ),
                                              Text(
                                                '₹${controller.houseBoatData.value[index].offerAmount}',
                                                style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF00A6F6)),
                                              ),
                                              Text(
                                                '₹${controller.houseBoatData.value[index].budget}/-',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                    fontFamily: 'Lato',
                                                    // line text
                                                    decoration: TextDecoration.lineThrough),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
        }
      },
    );
  }
}
