import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/agencyapicontroller.dart';

class CampingProviders extends StatelessWidget {
  final AgencyApiController controller = Get.put(AgencyApiController());
  CampingProviders({
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
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.agencyData.value.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                child: Column(
                  children: [
                    controller.agencyData.value[index].logo!.isEmpty ||
                            controller.agencyData.value[index].logo != null
                        ? CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(Api.imageUrl +
                                "${controller.agencyData.value[index].logo}"),
                          )
                        : CircleAvatar(
                            radius: 45,
                            backgroundImage:
                                AssetImage('assets/images/background.jpg'),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      //name first word
                      '${controller.agencyData.value[index].name!.split(' ')[0]}',
                    ),
                    //Text(
                     // '${controller.agencyData.value[index].name!.split(' ')[1]}',
                    //),
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
        );
      }
    });
  }
}
