import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/home/components/catrgory.dart';
import 'package:trip_calicut/screens/home/components/titletext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trip_calicut/screens/home/widgets.dart';

import 'components/carousel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Container with background image
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1645379033960-72d6cb488c0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                decoration: BoxDecoration(
                  color: Color(0xffE5E5E5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          //spaceevenly
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Category(
                                    image: 'assets/icons/tours.svg',
                                    title: 'Tours'),
                                Category(
                                    image: 'assets/icons/resort.svg',
                                    title: 'Resort'),
                                Category(
                                    image: 'assets/icons/trekking.svg',
                                    title: 'Trekking'),
                              ],
                            ),
                            Column(
                              children: [
                                Category(
                                    image: 'assets/icons/houseboat.svg',
                                    title: 'House Boat'),
                                Category(
                                    image: 'assets/icons/travel.svg',
                                    title: 'Travel'),
                                Category(
                                    image: 'assets/icons/homestay.svg',
                                    title: 'Homestay'),
                              ],
                            ),
                            Column(
                              children: [
                                Category(
                                    image: 'assets/icons/places.svg',
                                    title: 'Places'),
                                Category(
                                    image: 'assets/icons/blindspot.svg',
                                    title: 'Blind Spot'),
                                Category(
                                    image: 'assets/icons/education.svg',
                                    title: 'Education'),
                              ],
                            ),
                            Column(
                              children: [
                                Category(
                                    image: 'assets/icons/camping.svg',
                                    title: 'camping'),
                                Category(
                                    image: 'assets/icons/globaltravel.svg',
                                    title: 'Global Travel'),
                                Category(
                                    image: 'assets/icons/jobs.svg',
                                    title: 'Jobs'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // SizedBox(
                    //   height: 25.h,
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Container(
                        height: 150.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1583037189850-1921ae7c6c22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1075&q=80'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TitleText(text: 'Top Attractions'),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          topAttractions(),
                          SizedBox(
                            width: 10.w,
                          ),
                          topAttractions(),
                          SizedBox(
                            width: 10.w,
                          ),
                          topAttractions(),
                          SizedBox(
                            width: 10.w,
                          ),
                          topAttractions(),
                          SizedBox(
                            width: 10.w,
                          ),
                          topAttractions(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TitleText(text: 'Nearby Places'),
                    ),
                    Container(
                      height: 150.h,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                        ),
                        items: imageSliders,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleText(text: 'Trif Switches'),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  //spaceevenly
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Category(
                                        image: 'assets/icons/tours.svg',
                                        title: 'Tours'),
                                    Category(
                                        image: 'assets/icons/resort.svg',
                                        title: 'Resort'),
                                    Category(
                                        image: 'assets/icons/trekking.svg',
                                        title: 'Trekking'),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Category(
                                        image: 'assets/icons/tours.svg',
                                        title: 'Tours'),
                                    Category(
                                        image: 'assets/icons/resort.svg',
                                        title: 'Resort'),
                                    Category(
                                        image: 'assets/icons/trekking.svg',
                                        title: 'Trekking'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TitleText(text: 'Trifs Vodcasts'),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Container(
                                  height: 100.h,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1645379033960-72d6cb488c0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text('Wayanadan Vibes'),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        'Wayanad is a rural district in Kerala state, southwest India. In the east, the Wayanad Wildlife Sanctuary is a lush, forested region with areas of ....',
                                        maxLines: 3,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 10.sp),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TitleText(text: 'Recommended Packages'),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                  height: 150.h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1645379033960-72d6cb488c0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                TitleText(text: 'Manali Package'),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('₹'),
                                        Text('2000/-'),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '₹2500',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              // line text
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text('20%Off'),
                                      ],
                                    ),
                                    Text('Athirapilly'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
