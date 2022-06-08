import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/jobsapicardcontroller.dart';
import 'package:trip_calicut/screens/education/education_inner.dart';
import 'package:trip_calicut/widgets.dart';

import '../../../../controllers/houseboatapicardcontroller.dart';

// import '../job_screen_inner.dart';

class HouseBoatList extends StatelessWidget {
  final JobsApiCardController controller = Get.put(JobsApiCardController());
  final agentId;
  final HouseboatApiCardController houseBoatController = Get.put(HouseboatApiCardController());

  HouseBoatList({
    Key? key, this.agentId,
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
            itemCount: houseBoatController.houseBoatData.value.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) => houseBoatController.houseBoatData.value[index].agencyId == agentId ? GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => EducationInnerScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      // padding: EdgeInsets.all(8),

                      // height: 105.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border.all(width: 1, color: Colors.grey), borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          houseBoatController.houseBoatData.value[index].image!.isEmpty ||
                                houseBoatController.houseBoatData.value[index].image == null ?
                          Container(
                            height: 12.h,
                            width: 26.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: 
                                 AssetImage('assets/images/no_image/noimage_square.jpeg'),
                                 
                                fit: BoxFit.cover,
                              ),
                            ),
                          ) :
                          Container(
                            height: 12.h,
                            width: 26.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: 
                                 NetworkImage(Api.imageUrl + '${houseBoatController.houseBoatData.value[index].image}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          widthSizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30.w,
                                child: Text(
                                  '${houseBoatController.houseBoatData.value[index].name}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    // fontFamily: 'Lato'
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  // Icon(
                                  //   Icons.location_pin,
                                  //   size: 18,
                                  //   color: Color(0xFF00A6F6),
                                  // ),
                                  Text(
                                    '100+ Successful stories',
                                    style: TextStyle(fontSize: 14, color: Colors.green, fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Container(
                                width: 55.w,
                                child: Text(
                                  'Tuition Fee Starts from ₹12,00,000/year.',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF00A6F6).withOpacity(0.4),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topRight: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                            child: Center(
                              child: Text(
                                '₹40+ Packages',
                                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ) :
            Container(),
          );
        }
      },
    );
  }
}
