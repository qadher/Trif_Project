import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
      backgroundColor: Color(0xffebf5fb),
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
                // adsBanner(context),
                Container(
                  height: 140.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        autoPlayInterval: const Duration(seconds: 2),
                        enlargeCenterPage: false,
                        viewportFraction: 1),
                    items: imageSlidersBanner,
                  ),
                ),
                heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Kerala > Districts'),
                ),
                heightSizedBox(),
                District(),
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
                  child: ViewAll(
                    text: 'Top Destinations',
                  ),
                ),
                heightSizedBox(),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       FutureBuilder(builder: (context, index)=> TopDestination(index: index))
                //       // TopDestination(),
                //       // TopDestination(),
                //       // TopDestination(),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/imageone.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 200.h,
                        width: MediaQuery.of(context).size.width * 0.35,
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
                                        fontSize: 22.w,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    heightSizedBox(),
                                    Text(
                                      'Explore the world of adventure',
                                      maxLines: 3,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 16.w,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //add button

                              GestureDetector(
                                onTap: () {
                                  final snackBar = SnackBar(
                                    content: const Text('Hi, I am a SnackBar!'),
                                    backgroundColor: (Colors.black),
                                    action: SnackBarAction(
                                      label: 'dismiss',
                                      textColor: Colors.amber,
                                      onPressed: () {},
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Container(
                                  // height: 10.h,
                                  padding: EdgeInsets.all(15),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Explore',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
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
        Stack(children: [
          Container(
            height: 80.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.8, color: Colors.white),
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: 130.w,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Center(
                    child: Text(
                      'Malampuzha Dam',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
              ))
        ]),
        SizedBox(
          height: 10.h,
        ),
        Stack(children: [
          Container(
            height: 80.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.8, color: Colors.white),
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: 130.w,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Center(
                    child: Text(
                      'Malampuzha Dam',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
              ))
        ]),
      ],
    );
  }

}