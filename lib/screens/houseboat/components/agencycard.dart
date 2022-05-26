import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/agencyapicontroller.dart';
import 'package:trip_calicut/controllers/agencysinglepagecontroller.dart';
import 'package:trip_calicut/screens/houseboat/singlepage/package/model/houseboatpackagemodel.dart';

import '../../../controllers/houseboatapicardcontroller.dart';
import '../../../widgets.dart';
import '../../home/components/packagecard.dart';
import 'package:http/http.dart' as http;



List<int> listHouseboatId = [];

class AgencyCard extends StatelessWidget {
  final AgencyApiController controller = Get.put(AgencyApiController());
  final HouseboatApiCardController controllerHouseBoat =
      Get.put(HouseboatApiCardController());
       final AgencySinglePageController controllerAgency =
      Get.put(AgencySinglePageController());

  AgencyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //for loop list add api field id
    for (var i = 0; i < controllerHouseBoat.houseBoatData.value.length; i++) {
      listHouseboatId
          .add(controllerHouseBoat.houseBoatData.value[i].id!.toInt());
    }

    return Container(
      height: 125,
      child: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.agencyData.value.length,
              separatorBuilder: (context, index) => SizedBox(
                width: 4,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // print(controller.agencyData.value[8].name);
                    //  Get.toNamed('/singlepage',arguments: [controller.agencyData.value[index],controller],  );
                    print('HouseBoat id : $listHouseboatId');
                    // print(listHouseboatId);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      child: Column(
                        children: [
                          controller.agencyData.value[index].logo!.isEmpty
                              ? CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage('assets/images/imageone.jpg'),
                                )
                              : CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(Api.imageUrl +
                                      '/${controller.agencyData.value[index].logo}'),
                                ),
                          // CircleAvatar(
                          //   radius: 40.sp,
                          //   backgroundImage: NetworkImage(Api.imageUrl +
                          //       '${controller.agencyData.value[index].logo}'),
                          // ),
                          heightSizedBox(),
                          Text(
                            '${controller.agencyData.value[index].name!.split(' ')[0]}\nAgency',
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
