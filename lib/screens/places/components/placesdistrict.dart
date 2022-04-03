import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                // mainAxisSpacing: 15,
                mainAxisExtent: 100.h,
              ),
              itemCount: controller.districtData.value.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      height: 68.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(Api.imageUrl +
                                  '${controller.districtData.value[index].image}'),
                              fit: BoxFit.cover),
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      // child: Center(child: Text('$index')),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Center(
                        child: Text(
                          '${controller.districtData.value[index].name}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}