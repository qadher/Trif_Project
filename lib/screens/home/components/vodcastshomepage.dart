import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/screens/houseboat/components/shimmerhouseboatscreen.dart';

class VodcastsHomePage extends StatelessWidget {
  const VodcastsHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => 
      // Get.toNamed('/vodcastSinglePage'),
      Get.to(ShimmerHouseBoatScreen()),
      child: Container(
          height: 16.h,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/no_image/noimage_square.jpeg'),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 3),
                width: MediaQuery.of(context).size.width * 0.5,
                child: RichText(
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Wayanadan Vibes\n',
                        style: TextStyle(fontSize: 12.sp, fontFamily: 'Lato', fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      
                      TextSpan(
                        text:
                            '\nWayanad is a rural district in Kerala state, southwest India. In the east, the Wayanad Wildlife Sanctuary is a lush, forested region with areas of',
                        style: TextStyle(fontSize: 12.sp, fontFamily: 'Lato', color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
