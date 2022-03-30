import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopAttractionCard extends StatelessWidget {
  const TopAttractionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text('Manali',
                      style: TextStyle(
                        fontFamily: 'Lato',
                      )),
                ),
              ))
        ],
      ),
    );
  }
}
