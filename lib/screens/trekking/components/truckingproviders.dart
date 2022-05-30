import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/agencyapicontroller.dart';

class TruckingProviders extends StatelessWidget {
  final AgencyTrekkingController controller = Get.put(AgencyTrekkingController());

   TruckingProviders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  child: Column(
                    children: [
                      controller.agencyData.value[index].logo!.isEmpty ||
                      controller.agencyData.value[index].logo == null
                          ? CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            AssetImage('assets/images/no_image/noimage_square.jpeg'),
                      ):
                      CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            NetworkImage(Api.imageUrl + '${controller.agencyData.value[index].logo!}'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //text with split word
                      
                      Text('${controller.agencyData.value[index].name!.split(' ')[0]}'),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 2,
              );
            },
          ),
        );
      }
    });
  }
}
