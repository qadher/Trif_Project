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
              
              height: 105.h,
              decoration: BoxDecoration(
                color: Colors.white,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Container(
                    height: 105.h,
                    width: 100.w,
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
                        child: Text(
                          'JCB Operator',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'Lato'
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
                                fontSize: 15,
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
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        'Edabroad is one of the leading study abroad\nconsultants in Cochin with immense ...',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      heightSizedBox(),
                    ],
                  )
                ],
              ),
            ),
            
            Positioned(
              bottom: 2.h,
              right: 10.h,
              child: Text(
                'Provided By Naukari obs',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
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
                      fontSize: 16,
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
