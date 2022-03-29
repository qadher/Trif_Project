import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Category extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onClick;

  Category({Key? key, required this.image, required this.title, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onClick,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 50.h,
              width: 50.w,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              title,
              style: TextStyle(
                color: Color.fromARGB(255, 104, 103, 103),
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'Lato',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryMain extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onClick;

  CategoryMain({Key? key, required this.image, required this.title, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onClick,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 40.h,
              width: 40.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style: TextStyle(
                color: Color.fromARGB(255, 104, 103, 103),
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'Lato',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
