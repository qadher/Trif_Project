import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/agencyapicontroller.dart';

class CampingProviders extends StatelessWidget {
  final AgencyCampingController controller = Get.put(AgencyCampingController());
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
            return GestureDetector(
              onTap: () => Get.toNamed(
                '/agencysinglepage',
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: controller.agencyData.value[index].logo!.isEmpty || controller.agencyData.value[index].logo == null
                                ? Image.asset(
                                    'assets/images/no_image/noimage_square.jpeg',
                                    fit: BoxFit.cover,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: Api.imageUrl + "${controller.agencyData.value[index].logo}",
                                    fit: BoxFit.cover,
                                  )),
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
