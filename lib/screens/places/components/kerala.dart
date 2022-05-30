import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/screens/tours/components/kerala.dart';

import '../../../controllers/keraladistrictcardcontroller.dart';

class KeralaWidget extends StatelessWidget {
  final KeralaDistrictCardController controller =
      Get.put(KeralaDistrictCardController());

  KeralaWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
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
              itemCount: districtNames.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      '/keralaplaces',
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        // width: MediaQuery.of(context).size.width * 0.25,
                        height: 10.h,

                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(districtImages[index]),
                                fit: BoxFit.cover),
                            color: Color.fromARGB(255, 179, 179, 179),
                            borderRadius: BorderRadius.circular(20)),
                        // child: Center(child: Text('$index')),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          '${districtNames[index]}',
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
