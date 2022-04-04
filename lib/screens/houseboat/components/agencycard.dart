import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/agencyapicontroller.dart';

import '../../../widgets.dart';

class AgencyCard extends StatelessWidget {
  final AgencyApiController controller = Get.put(AgencyApiController());
  AgencyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      child: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.agencyData.value.length - 3,
            separatorBuilder: (context, index) => SizedBox(
              width: 4.w,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // print(controller.agencyData.value[8].name);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    child: Column(
                      children: [
                        controller.agencyData.value[index].logo!.isEmpty ||
                                controller.agencyData.value[index].logo! == null
                            ? CircleAvatar(
                                radius: 40.sp,
                                backgroundImage:
                                    AssetImage('assets/images/imageone.jpg'),
                              )
                            : CircleAvatar(
                                radius: 40.sp,
                                backgroundImage: NetworkImage(Api.imageUrl +
                                    '${controller.agencyData.value[index].logo}'),
                              ),
                        // CircleAvatar(
                        //   radius: 40.sp,
                        //   backgroundImage: NetworkImage(Api.imageUrl +
                        //       '${controller.agencyData.value[index].logo}'),
                        // ),
                        heightSizedBox(),
                        Text(
                          '${controller.agencyData.value[index].name!.split(' ')[0]}\n' +
                              '${controller.agencyData.value[index].name!.split(' ')[1]}',
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
      }),
    );
  }
}
