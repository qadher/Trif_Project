import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/camping/campingscreen.dart';
import 'package:trip_calicut/screens/home/components/catrgory.dart';
import 'package:trip_calicut/screens/home/components/titletext.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trip_calicut/screens/home/components/topattractions.dart';
import 'package:trip_calicut/screens/homestay/homestayscreen.dart';
import 'package:trip_calicut/screens/houseboat/houseboatscreen.dart';
import 'package:trip_calicut/screens/places/placescreen.dart';
import 'package:trip_calicut/screens/resort/resortscreen.dart';
import 'package:trip_calicut/screens/tours/tourscreen.dart';
import 'package:trip_calicut/screens/travel/travelscreen.dart';
import 'package:trip_calicut/screens/trekking/trekkingscreen.dart';

import '../../components/packagecard.dart';
import 'components/carousel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Container with background image
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Image.network(
                  //   'https://images.unsplash.com/photo-1645379033960-72d6cb488c0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  color: Colors.black.withOpacity(0.3),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.10,
                  left: MediaQuery.of(context).size.width * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Let’s Explore \nThe World',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                          fontFamily: 'SpectralSC',
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'Thrissur, Kerala',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'Lato'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25),
                  decoration: BoxDecoration(
                    color: Color(0xffebf5fb ),
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
                                      title: 'Tours',
                                      onClick:
                                          //navigate to tourScreen
                                          () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TourScreen(),
                                          ),
                                        );
                                      }),
                                  Category(
                                      image: 'assets/icons/resort.svg',
                                      title: 'Resort',
                                      onClick: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ResortScreen(),
                                          ),
                                        );
                                      }),
                                  Category(
                                      image: 'assets/icons/trekking.svg',
                                      title: 'Trekking',
                                      onClick: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TrekkingScreen(),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                              Column(
                                children: [
                                  Category(
                                      image: 'assets/icons/houseboat.svg',
                                      title: 'House Boat',
                                      onClick: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HouseBoatScreen(),
                                          ),
                                        );
                                      }),
                                  Category(
                                      image: 'assets/icons/travel.svg',
                                      title: 'Travel',
                                      onClick: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TravelScreen(),
                                          ),
                                        );
                                      }),
                                  Category(
                                      image: 'assets/icons/homestay.svg',
                                      title: 'Homestay',
                                      onClick: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomeStayScreen(),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                              Column(
                                children: [
                                  Category(
                                      image: 'assets/icons/places.svg',
                                      title: 'Places',
                                      onClick: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PlaceScreen(),
                                          ),
                                        );
                                      }),
                                  Category(
                                      image: 'assets/icons/blindspot.svg',
                                      title: 'Blind Spot',
                                      onClick: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TourScreen(),
                                          ),
                                        );
                                      }),
                                  Category(
                                      image: 'assets/icons/education.svg',
                                      title: 'Education',
                                      onClick: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TourScreen(),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                              Column(
                                children: [
                                  Category(
                                      image: 'assets/icons/camping.svg',
                                      title: 'camping',
                                      onClick: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CampingScreen(),
                                          ),
                                        );
                                      }),
                                  Category(
                                      image: 'assets/icons/globaltravel.svg',
                                      title: 'Global Travel',
                                      onClick: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TourScreen(),
                                          ),
                                        );
                                      }),
                                  Category(
                                      image: 'assets/icons/jobs.svg',
                                      title: 'Jobs',
                                      onClick: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TourScreen(),
                                          ),
                                        );
                                      }),
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
                              image: AssetImage('assets/images/imageone.jpg'),
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              TopAttractions(),
                              SizedBox(
                                width: 10.w,
                              ),
                              TopAttractions(),
                              SizedBox(
                                width: 10.w,
                              ),
                              TopAttractions(),
                              SizedBox(
                                width: 10.w,
                              ),
                              TopAttractions(),
                              SizedBox(
                                width: 10.w,
                              ),
                              TopAttractions(),
                            ],
                          ),
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
                                        title: 'Tours',
                                        onClick: () {},
                                      ),
                                      Category(
                                        image: 'assets/icons/resort.svg',
                                        title: 'Resort',
                                        onClick: () {},
                                      ),
                                      Category(
                                        image: 'assets/icons/trekking.svg',
                                        title: 'Trekking',
                                        onClick: () {},
                                      ),
                                       Category(
                                        image: 'assets/icons/tours.svg',
                                        title: 'Tours',
                                        onClick: () {},
                                      ),
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
                                        title: 'Tours',
                                        onClick: () {},
                                      ),
                                      Category(
                                        image: 'assets/icons/resort.svg',
                                        title: 'Resort',
                                        onClick: () {},
                                      ),
                                      Category(
                                        image: 'assets/icons/trekking.svg',
                                        title: 'Trekking',
                                        onClick: () {},
                                      ),
                                      Category(
                                        image: 'assets/icons/tours.svg',
                                        title: 'Tours',
                                        onClick: () {},
                                      ),
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
                                        image: AssetImage(
                                            'assets/images/imageone.jpg'),
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
                                        Text(
                                          'Wayanadan Vibes',
                                          style: TextStyle(
                                            fontFamily: 'Lato',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          'Wayanad is a rural district in Kerala state, southwest India. In the east, the Wayanad Wildlife Sanctuary is a lush, forested region with areas of ....',
                                          maxLines: 3,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 10.sp,
                                            fontFamily: 'Lato',
                                          ),
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
                            ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
                              separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                              itemBuilder: (context, index) => PackageCard(),
                            )
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
      ),
    );
  }
}
