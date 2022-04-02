import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/home/components/titletext.dart';

class HouseBoatPackageCard extends StatelessWidget {
  const HouseBoatPackageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),

        child: Row(
          children: [
            Container(
              height: 135.h,
              width: 135.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage('assets/images/imageone.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.w,top: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 190.w,
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'River Woods  uih ikjk l;j l; jkhkkj',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato',
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 18,
                              color: Color(0xFF00A6F6),
                            ),
                            Text(
                              'Wayanad',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding:  EdgeInsets.only(bottom: 12.h),
                               child: Text(
                                 'Verified',
                                 overflow: TextOverflow.ellipsis,
                                 maxLines: 1,
                                 style: TextStyle(
                                     fontSize: 20.sp,
                                     fontWeight: FontWeight.bold,
                                     fontFamily: 'Lato',
                                     color: Colors.black.withOpacity(0.5)),
                               ),
                             ),
                             Column(
                               children: [
                                 Text(
                                   '20%Off',
                                   style: TextStyle(
                                       fontFamily: 'Lato',
                                       fontSize: 16.sp,
                                       fontWeight: FontWeight.bold,
                                       color: Color(0xFFF6B100)),
                                 ),
                                 Text(
                                   '₹2000/-',
                                   style: TextStyle(
                                       fontFamily: 'Lato',
                                       fontSize: 20.sp,
                                       fontWeight: FontWeight.bold,
                                       color: Color(0xFF00A6F6)),
                                 ),
                                 Text(
                                   '₹2500',
                                   style: TextStyle(
                                       color: Colors.grey,
                                       fontSize: 16.sp,
                                       fontFamily: 'Lato',
                                       // line text
                                       decoration: TextDecoration.lineThrough),
                                 ),
                               ],
                             )
                           ],
                         )
                      ],
                    ),
                  ),
                 
                ],
              ),
            )
          ],
        ),
        // child: Column(
        //   children: [
        //     Container(
        //       height: 120.h,
        //       width: MediaQuery.of(context).size.width,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(15),
        //         image: DecorationImage(
        //           image: AssetImage('assets/images/imageone.jpg'),
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       height: 10.h,
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         TitleText(text: 'Manali Package'),
        //       ],
        //     ),
        //     SizedBox(
        //       height: 10.h,
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Row(
        //           children: [
        //             // Text('₹'),
        //             Text(
        //               '₹2000/-',
        //               style: TextStyle(
        //                   fontFamily: 'Lato',
        //                   fontSize: 22,
        //                   fontWeight: FontWeight.bold,
        //                   color: Color(0xFF00A6F6)),
        //             ),
        //             SizedBox(
        //               width: 8.w,
        //             ),
        //             Text(
        //               '₹2500',
        //               style: TextStyle(
        //                   color: Colors.grey,
        //                   fontSize: 18,
        //                   fontFamily: 'Lato',
        //                   // line text
        //                   decoration: TextDecoration.lineThrough),
        //             ),
        //             SizedBox(
        //               width: 5.w,
        //             ),
        //             Text(
        //               '20%Off',
        //               style: TextStyle(
        //                   fontFamily: 'Lato',
        //                   fontSize: 18,
        //                   fontWeight: FontWeight.bold,
        //                   color: Color(0xFFF6B100)),
        //             ),
        //           ],
        //         ),
        //         Text(
        //           'Athirapilly',
        //           style: TextStyle(
        //             fontFamily: 'Lato',
        //             color: Color.fromARGB(255, 102, 101, 101),
        //             fontWeight: FontWeight.bold,
        //             fontSize: 18,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
