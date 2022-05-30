import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets.dart';

class VodcastTile extends StatelessWidget {
  const VodcastTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                        'assets/images/no_image/noimage_landscape.jpeg',
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
          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehen',
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