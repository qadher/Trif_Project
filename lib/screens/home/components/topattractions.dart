import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopAttractionCard extends StatelessWidget {
  const TopAttractionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137.h,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => TopAttractions(),
              separatorBuilder: (context, index) => SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}

class TopAttractions extends StatelessWidget {
  const TopAttractions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 137.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFFDCDCDC),
          ),
        ),
        Container(
          height: 129.h,
          width: 110.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFAEAEAE)),
        ),
        Container(
          //background image
          height: 120.h,
          width: 120.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage('assets/images/imageone.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 11.h,
          left: 0,
          child: Container(
            width: 80.w,
            decoration: BoxDecoration(
              color: Color(0xFFF6B100),
              borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),

            ),
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 3),
              child: Text(
                'Manali',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ],
    ),
    );
  }
}
