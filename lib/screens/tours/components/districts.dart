import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DistrictCard extends StatelessWidget {
  const DistrictCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //background image
          height: 90.h,
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            image: DecorationImage(
              image: AssetImage('assets/images/imageone.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text('Calicut')
      ],
    );
  }
}
