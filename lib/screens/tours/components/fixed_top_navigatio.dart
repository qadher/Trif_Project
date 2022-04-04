import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FixedTopNavigation extends StatelessWidget {
  const FixedTopNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios,
                color: Colors.white,
                size: 25.h,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.6),
                radius: 20.h,
                child: Icon(Icons.search,
                color: Colors.black,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
