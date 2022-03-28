import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopAttractions extends StatelessWidget {
  const TopAttractions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //background image
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage('assets/images/imageone.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 10.h,
            child: Container(
              width: 80.w,
              color: Colors.yellow,
              child: Text('e'),
            ))
      ],
    );
  }
}
