import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ControlSwitch extends StatelessWidget {
  const ControlSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff00A6F6),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                ),
                alignment: Alignment.center,
                height: 5.h,
                width: 31.w,
                child: Text(
                  'Bachelors',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
              SizedBox(
              width: 2,
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(50),
                  //     topLeft: Radius.circular(50)),
                ),
                alignment: Alignment.center,
                height: 5.h,
                width: 31.w,
                child: Text(
                  'Masters',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.6)),
                ),
              ),
            ),
            SizedBox(
              width: 2,
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                alignment: Alignment.center,
                height: 5.h,
                width: 31.w,
                child: Text(
                  'Doctorate/Phd',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.6)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
