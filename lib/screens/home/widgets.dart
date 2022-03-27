import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Stack topAttractions() {
  return Stack(
    children: [
      Container(
        //background image
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1583037189850-1921ae7c6c22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1075&q=80'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
          top: 10.h,
          child: Container(
            color: Colors.yellow,
            child: Text('ernakulam'),
          ))
    ],
  );
}


