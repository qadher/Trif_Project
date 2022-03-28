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
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1583037189850-1921ae7c6c22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1075&q=80'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text('Calicut')
      ],
    );
  }
}
