import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Category extends StatelessWidget {
  final String image;
  final String title;

  Category({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            height: 25.h,
            width: 25.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 10
            ),
          ),
        ],
      ),
    );
  }
}
