import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trip_calicut/controllers/packageapicardcontroller.dart';

import '../screens/home/components/titletext.dart';

class PackageCardList extends StatelessWidget {
  final PackageApiCardController controller =
      Get.put(PackageApiCardController());

  final url = 'https://trifs.in';

  PackageCardList({
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
            itemCount: controller.packageData.value.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Container(
                    height: 120.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage('$url${controller.packageData.value[index].image!}'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TitleText(text: controller.packageData.value[index].name!.substring(0, 1).toUpperCase() +
                  controller.packageData.value[index].name!.substring(1).toLowerCase(),),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Text('₹'),
                          Text(
                            '₹${controller.packageData.value[index].avgAmount!.toString()}/-',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00A6F6)),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '₹${controller.packageData.value[index].offerAmount!.toString()}',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.sp,
                                fontFamily: 'Lato',
                                // line text
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '${controller.packageData.value[index].advAmount!.toString()}%Off',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF6B100)),
                          ),
                        ],
                      ),
                      Text(
                        controller.packageData.value[index].name!.substring(0, 1).toUpperCase() +
                  controller.packageData.value[index].name!.substring(1).toLowerCase().split(' ')[0],
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Color.fromARGB(255, 102, 101, 101),
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
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

class PackageCard extends StatelessWidget {
  const PackageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            height: 120.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage('assets/images/imageone.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleText(text: 'Manali Package'),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Text('₹'),
                  Text(
                    '₹2000/-',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00A6F6)),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '₹2500',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontFamily: 'Lato',
                        // line text
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '20%Off',
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF6B100)),
                  ),
                ],
              ),
              Text(
                'Athirapilly',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Color.fromARGB(255, 102, 101, 101),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
