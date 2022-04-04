import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FixedBottomSwitch extends StatelessWidget {
  const FixedBottomSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff00A6F6),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topLeft: Radius.circular(50)),
              ),
              alignment: Alignment.center,
              height: 45.h,
              width: 150.w,
              child: Text(
                'Enqury Now',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff00A6F6),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              alignment: Alignment.center,
              height: 45.h,
              width: 150.w,
              child: Text(
                'Call Now',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
