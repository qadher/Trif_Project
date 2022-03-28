import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/home/components/titletext.dart';

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
            height: 150.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/images/imageone.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TitleText(text: 'Manali Package'),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('₹'),
                  Text('2000/-'),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '₹2500',
                    style: TextStyle(
                        color: Colors.grey,
                        // line text
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('20%Off'),
                ],
              ),
              Text('Athirapilly'),
            ],
          ),
        ],
      ),
    );
  }
}
