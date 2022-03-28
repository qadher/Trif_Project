import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget heightSizedBox(){
  return SizedBox(
    height: 10.h,
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
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1529171696861-bac785a44828?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'),
          ),
          heightSizedBox(),
          Text('kannur')
        ],
      ),
    );
  }