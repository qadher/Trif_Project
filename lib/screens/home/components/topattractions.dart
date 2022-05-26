import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/attractionapicardcontroller.dart';

class TopAttractionCard extends StatelessWidget {
  final AttractionApiCardController controller =
      Get.put(AttractionApiCardController());

  TopAttractionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.attractionData.value.length,
                    itemBuilder: (context, index) => GestureDetector(
                       onTap: () {
                Get.toNamed('/attractionsinglepage',arguments: [
                 controller.attractionData.value[index].id,
                 
                
                
                 
                 ],  );
              },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 18.h,
                              width: 28.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFFDCDCDC),
                              ),
                            ),
                            Container(
                              height: 17.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFFAEAEAE)),
                            ),
                            controller.attractionData.value[index].image!.isEmpty ||
                            controller.attractionData.value[index].image == null ?
                                
                            Container(
                              //background image
                              height: 16.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/no_image/noimage_square.jpeg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ): Container(
                              //background image
                              height: 16.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    Api.imageUrl +
                                        '${controller.attractionData.value[index].image!}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            //  assets/images/no_image/noimage_square.jpeg
                           
                            
                            Positioned(
                              top: 11,
                              left: 0,
                              child: Container(
                                width: 25.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6B100),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 3),
                                  child: Text(
                                    //first letter capital
                                    controller.attractionData.value[index].name!
                                            .substring(0, 1)
                                            .toUpperCase() +
                                        controller
                                            .attractionData.value[index].name!
                                            .substring(1)
                                            .toLowerCase()
                                            .split(' ')[0],
                                    // controller.attractionData.value[index].name!.split(' ')[0],
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TopAttractions extends StatelessWidget {
  const TopAttractions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 137,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFDCDCDC),
            ),
          ),
          Container(
            height: 129,
            width: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFAEAEAE)),
          ),
          Container(
            //background image
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('assets/images/imageone.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 0,
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                color: Color(0xFFF6B100),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                child: Text(
                  'Manali',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
