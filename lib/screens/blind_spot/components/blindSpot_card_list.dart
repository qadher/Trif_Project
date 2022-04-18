import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/travelpackageapicardcontroller.dart';
import 'package:trip_calicut/widgets.dart';

class BlindSpotCard extends StatelessWidget {
  BlindSpotCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      itemCount: 4,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: index.isEven
              ? Container(
                  // padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 213, 227, 234),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Bhoothan Moola ',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lato',
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '20 Jan 2022',
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        heightSizedBox(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '“Andoor Kandan Sree Dharma Sastha Temple has its place in the most revered Sastha Temples in South Kerala. Lord Kandan Sree Dharma Sastha is the main deity worshipped in the temple.”',
                                    textAlign: TextAlign.start,
                                    // overflow: TextOverflow.ellipsis,
                                    // maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontStyle: FontStyle.italic,
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                    ),
                                  ),
                                  heightSizedBox(),
                                  Row(
                                    children: [
                                      Text(
                                        'suggested by',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          // fontWeight: FontWeight.bold,
                                          fontFamily: 'Lato',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        ' Jiss Anto',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lato',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            SizedBox(
                              child: Container(
                                width: 25.w,
                                height: 13.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: AssetImage (
                                      'assets/images/imageone.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : Container(
                  // padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 213, 227, 234),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '20 Jan 2022',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Bhoothan Moola ',
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        heightSizedBox(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              child: Container(
                                width: 25.w,
                                height: 13.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/imageone.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '“Andoor Kandan Sree Dharma Sastha Temple has its place in the most revered Sastha Temples in South Kerala. Lord Kandan Sree Dharma Sastha is the main deity worshipped in the temple.”',
                                    textAlign: TextAlign.start,
                                    // overflow: TextOverflow.ellipsis,
                                    // maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontStyle: FontStyle.italic,
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                    ),
                                  ),
                                  heightSizedBox(),
                                  Row (
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'suggested by',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          // fontWeight: FontWeight.bold,
                                          fontFamily: 'Lato',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        ' Jiss Anto',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lato',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
