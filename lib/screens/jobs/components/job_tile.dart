import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/jobs/job_screen_inner.dart';
import 'package:trip_calicut/widgets.dart';

class JobTile extends StatelessWidget {
  const JobTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>JobInnerScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              // padding: EdgeInsets.all(8),
              
              // height: 105.h,
              decoration: BoxDecoration(
                color: Colors.white,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Container(
                    height: 130.h,
                    width: 109.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/images/imageone.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  widthSizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: 100.w,
                          child: Text(
                            'JCB Operatorfdgdsthbfdyjh fdhgdjtfgj',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              // fontFamily: 'Lato'
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 18,
                            color: Color(0xFF00A6F6),
                          ),
                          Text(
                            'Canada',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Exp. required: 1 - 5 yrs',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                     Container(
                       width: 200.w,
                       child:  Text(
                        'Edabroad is one of the leading study abroadconsultants in Cochin wijsdgfjksdhgjbhdykl;ykl;jlkjkl;jth immense ...',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12.sp,
                            ),
                      ),
                     ),
                      SizedBox(height:25.h),
                    ],
                  )
                ],
              ),
            ),
            
            Positioned(
              bottom: 5.h,
              right: 14.h,
              child: Text(
                'Provided By Naukari obs',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: Color(0xFF00A6F6),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF00A6F6).withOpacity(0.4),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
                  child: Center(
                    child: Text('₹30,000 per Annum',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                    ),),
                  ),
                ),
            ))
          ],
        ),
      ),
    );
  }
}
