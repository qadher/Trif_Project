import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/home/components/titletext.dart';
import 'package:trip_calicut/screens/tours/components/districts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:trip_calicut/widgets.dart';

import '../../components/viewall.dart';
import '../home/components/carousel.dart';
import '../widgets.dart';
import 'components/AppBarWidget.dart';
import 'components/staggered_grid.dart';
import 'components/topdestination.dart';

class TourScreen extends StatelessWidget {
  const TourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Tours',
        ),
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                adsBanner(context),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Kerala > Districts'),
                ),
                heightSizedBox(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        DistrictCard(),
                        SizedBox(
                          width: 10.w,
                        ),
                        DistrictCard(),
                        SizedBox(
                          width: 10.w,
                        ),
                        DistrictCard(),
                        SizedBox(
                          width: 10.w,
                        ),
                        DistrictCard(),
                        SizedBox(
                          width: 10.w,
                        ),
                        DistrictCard(),
                      ],
                    ),
                  ),
                ),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Categories'),
                ),
                heightSizedBox(),
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
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ViewAll(text: 'Top Destinations',),
                ),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TopDestination(),
                      TopDestination(),
                      TopDestination(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://img.traveltriangle.com/blog/wp-content/uploads/2018/09/cover-for-Trekking-In-Kathmandu-e1582960550667.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 200.h,
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Colors.black.withOpacity(0.5),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 15.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Trekking',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    heightSizedBox(),
                                    Text(
                                      'Explore the world of adventure',
                                      maxLines: 3,
                                      style: TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //add button

                              Container(
                                // height: 10.h,
                                padding: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 200.h,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  scrollCard(),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  scrollCard(),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  scrollCard(),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  scrollCard(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TitleText(text: 'Recommeneded Places '),
                ),
                heightSizedBox(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  //height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: StaggeredPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 

  Column scrollCard() {
    return Column(
      children: [
        Container(
          height: 80.h,
          width: 100.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1529171696861-bac785a44828?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 80.h,
          width: 100.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1604239282228-6a723984962c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHRyaXB8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

