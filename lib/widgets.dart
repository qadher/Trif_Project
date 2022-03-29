import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget heightSizedBox(){
  return SizedBox(
    height: 12.h,
  );
}

Widget widthSizedBox(){
  return SizedBox(
    width: 10.w,
  );
}

 Container providerCard() {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.w,
            backgroundImage: AssetImage('assets/images/background.jpg'),
          ),
          heightSizedBox(),
          Text('kannur')
        ],
      ),
    );
  }