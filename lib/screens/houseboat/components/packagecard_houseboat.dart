import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/components/titletext.dart';

class PackageCardHouseBoat extends StatelessWidget {
  const PackageCardHouseBoat({
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
            width: 220.w,            decoration: BoxDecoration(
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
          Container(
            width: 210.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(text: 'River Woods'),
                    SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 18,
                            color: Color(0xFF00A6F6),
                          ),
                          Text(
                            'Canada',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '₹2000',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00A6F6)),
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
                )
              ],
            ),
          ),
          
          
        ],
      ),
    );
  }
}
