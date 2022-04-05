import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/controllers/homestaypackageapicardcontroller.dart';

import '../../../constant/api.dart';
import '../../home/components/titletext.dart';

class PackageHomeStay extends StatelessWidget {
  final HomeStayPackageApiCardController controller =
      Get.put(HomeStayPackageApiCardController());

  PackageHomeStay({
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
            itemCount: controller.homeStayData.value.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  controller.homeStayData.value[index].image!.isEmpty ||
                          controller.homeStayData.value[index].image == null
                      ? Container(
                          height: 20.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage('assets/images/imageone.jpg'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        )
                      : Container(
                          height: 20.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(Api.imageUrl +
                                  '${controller.homeStayData.value[index].image!}'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TitleText(
                        text: controller.homeStayData.value[index].name!
                                .substring(0, 1)
                                .toUpperCase() +
                            controller.homeStayData.value[index].name!
                                .substring(1)
                                .toLowerCase(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Text('₹'),
                          Text(
                            '₹${controller.homeStayData.value[index].offerAmount}/-',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00A6F6)),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '₹${controller.homeStayData.value[index].avgAmount}',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'Lato',
                                // line text
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${controller.homeStayData.value[index].advAmount}%Off',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF6B100)),
                          ),
                        ],
                      ),
                      Text(
                        controller.homeStayData.value[index].name!
                                .substring(0, 1)
                                .toUpperCase() +
                            controller.homeStayData.value[index].name!
                                .substring(1)
                                .toLowerCase()
                                .split(' ')[0],
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Color.fromARGB(255, 102, 101, 101),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
