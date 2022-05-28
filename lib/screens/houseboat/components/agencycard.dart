import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/agencyapicontroller.dart';

import '../../../widgets.dart';



List<int> listHouseboatId = [];

class AgencyCard extends StatelessWidget {
  
      final AgencyHouseBoatController agencyHouseBoatController =
      Get.put(AgencyHouseBoatController());

  AgencyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return Container(
      height: 125,
      child: Obx(
        () {
          if (agencyHouseBoatController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: agencyHouseBoatController.agencyData.value.length,
              separatorBuilder: (context, index) => SizedBox(
                width: 4,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // print(controller.agencyData.value[8].name);
                     Get.toNamed('/agencysinglepage',  );
                    print('HouseBoat id : $listHouseboatId');
                    // print(listHouseboatId);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      child: Column(
                        children: [
                          agencyHouseBoatController.agencyData.value[index].logo!.isEmpty
                              ? CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage('assets/images/no_image/noimage_square.jpeg'),
                                )
                              : CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(Api.imageUrl +
                                      '/${agencyHouseBoatController.agencyData.value[index].logo}'),
                                ),
                          // CircleAvatar(
                          //   radius: 40.sp,
                          //   backgroundImage: NetworkImage(Api.imageUrl +
                          //       '${controller.agencyData.value[index].logo}'),
                          // ),
                          heightSizedBox(),
                          Text(
                            '${agencyHouseBoatController.agencyData.value[index].name!.split(' ')[0]}\nAgency',
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
