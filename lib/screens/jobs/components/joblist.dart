import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/controllers/jobsapicardcontroller.dart';
import 'package:trip_calicut/widgets.dart';

import '../job_screen_inner.dart';

class JobList extends StatelessWidget {
  final JobsApiCardController controller = Get.put(JobsApiCardController());

  JobList({
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
            itemCount: controller.jobsData.value.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => JobInnerScreen(index: index,)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      // padding: EdgeInsets.all(8),

                      // height: 105.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            height: 130.h,
                            width: 109.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage('assets/images/imageone.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          widthSizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: 100.w,
                                  child: Text(
                                    '${controller.jobsData.value[index].name}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      // fontFamily: 'Lato'
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    size: 18.sp,
                                    color: Color(0xFF00A6F6),
                                  ),
                                  Text(
                                    '${controller.jobsData.value[index].place}',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                width: 200.w,
                                child: Text(
                                  '${controller.jobsData.value[index].experience}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Container(
                                width: 200.w,
                                child: Text(
                                  '${controller.jobsData.value[index].qualification}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 25.h),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 5.h,
                      right: 14.h,
                      child: Text(
                        'Provided By Naukari obs',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp,
                          color: Color(0xFF00A6F6),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF00A6F6).withOpacity(0.4),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 14),
                            child: Center(
                              child: Text(
                                '₹${controller.jobsData.value[index].salaryPackage} per Annum',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
