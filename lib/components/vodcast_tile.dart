import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/screens/tours/components/kerala.dart';

import '../widgets.dart';

class VodcastTile extends StatelessWidget {
final String name;
final int index;

   VodcastTile({
     
    Key? key, required this.name, required this.index,
  
  }) : super(key: key);
//  static MetaDataModel? metaData;



  @override
  Widget build(BuildContext context) {
    return 
    Row(
      children: [
        Stack(
          children: [
            Container(
              height:
                  8.h,
              width:
                  28.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        districtImages[index],
                      ))),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child:
                  Icon(
                Icons
                    .play_circle_outline,
                size:
                    28,
                color: Colors
                    .black
                    .withOpacity(0.5),
              ),
            ),
          ],
        ),
        widthSizedBox(),
        Flexible(
          child: Text('${name + (index + 1).toString()}',
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
          ),
        ),
      ],
    );
  }
}