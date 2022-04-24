import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';

import '../../../controllers/keraladistrictcardcontroller.dart';

class PlacesDistrict extends StatelessWidget {
  final KeralaDistrictCardController controller =
      Get.put(KeralaDistrictCardController());

  PlacesDistrict({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      //height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: 14.h,
              ),
              itemCount: controller.districtData.value.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      '/toursinglepage',
                      arguments: [
                        controller.districtData.value[index].id,
                        controller.districtData.value[index].image,
                        controller.districtData.value[index].name,
                      ],
                    );
                  },
                  child: Column(
                    children: [
                      controller.districtData.value[index].image!.isEmpty ||
                              controller.districtData.value[index].image == null
                          ? Container(
                              // width: MediaQuery.of(context).size.width * 0.25,
                              height: 10.h,

                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/imageone.jpg'),
                                      fit: BoxFit.cover),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              // child: Center(child: Text('$index')),
                            )
                          : Container(
                              // width: MediaQuery.of(context).size.width * 0.25,
                              height: 10.h,

                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(Api.imageUrl +
                                          '${controller.districtData.value[index].image}'),
                                      fit: BoxFit.cover),
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              // child: Center(child: Text('$index')),
                            ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          '${controller.districtData.value[index].name}',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
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
