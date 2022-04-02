import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/jobs/components/FixedBottomSwitch.dart';
import 'package:trip_calicut/screens/tours/components/AppBarWidget.dart';
import 'package:trip_calicut/widgets.dart';

class JobInnerScreen extends StatelessWidget {
  const JobInnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'JCB Operator',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 20.h),
                    // height: 300.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 130.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/JCB.jpg'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Colors.black),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 150.w,
                                height: 30.h,
                                child: Center(
                                  child: Text(
                                    '₹30,000 per Annum',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white60,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30))),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  width: 280.w,
                                  
                                  child: Text(
                                    'JCB Operator bnkbjkbn mnbjh',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                      // fontFamily: 'Lato'
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    size: 18.sp,
                                    color: Color(0xFF00A6F6),
                                  ),
                                  Text(
                                    'Canada',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'Exp. required: 1 - 5 yrs',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Text(
                                "Edabroad i jhbxdjkashi jkbwsdh jh wsxhbuios jhbw  ui uihgwdb uiasdb uioxbsuiobnXD UYBDNDXK UIOBASBs one of tjhgvcbasdjkhfnklsjgkdfskldfjkldnzxklfds   dbcasfjklawebkl dbmc jhdbcjhbj jhcbj jhc  jhdb jsbjklsdbklhe leading study abroad consultants in Cochin with immense expertise in providing study abroad overseas educational services across Cochin with immense expertise in providing study abroad overseas educational services across",
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                                maxLines: 5,
                              ),
                              // Text(
                              //   'Edabroad is one of the leading study abroad\nconsultants in Cochin with immense ...',
                              //   overflow: TextOverflow.ellipsis,
                              //   maxLines: 2,
                              // ),
                              heightSizedBox(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  heightSizedBox(),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 20.h),
                        // height: 305.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 130.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/studyabroad.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      color: Colors.black),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    width: 150.w,
                                    height: 30.h,
                                    child: Center(
                                      child: Text(
                                        '40+ Countries',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white60,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          topRight: Radius.circular(20)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 70.w),
                                      width: 180.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Rojin Jobs bjb  hbuhb  jh jh  Thrissur',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_pin,
                                                size: 18.sp,
                                                color: Color(0xFF00A6F6),
                                              ),
                                              Text(
                                                'Thiruvananthapuram',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      "Edabroad i jhbxdjkashi jkbwsdh jh wsxhbuios jhbw  ui uihgwdb uiasdb uioxbsuiobnXD UYBDNDXK UIOBASBs one of tjhgvcbasdjkhfnklsjgkdfskldfjkldnzxklfds   dbcasfjklawebkl dbmc jhdbcjhbj jhcbj jhc  jhdb jsbjklsdbklhe leading study abroad consultants in Cochin with immense expertise in providing study abroad overseas educational services across Cochin with immense expertise in providing study abroad overseas educational services across",
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                      maxLines: 5,
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 250.w,
                                          child: Text(
                                            'Other Jobs by Rojin Jobs',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                          color: Colors.blue,
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      // Positioned(
                      //   top: 140.h,
                      //   left: 100.w,
                      //   child:
                      // ),
                      Positioned(
                        top: 95.h,
                        left: 10.w,
                        child: CircleAvatar(
                          radius: 38.w,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                ],
              ),
            ),
            FixedBottomSwitch(),
          ],
        ),
      ),
    );
  }
}
