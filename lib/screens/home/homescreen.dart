import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_calicut/screens/home/components/titletext.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'components/img.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${imgList.indexOf(item)} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

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
                        'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                decoration: BoxDecoration(
                  color: Color(0xffF9F9F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                //spaceevenly
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  category(),
                                  category(),
                                  category(),
                                  category(),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                //spaceevenly
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  category(),
                                  category(),
                                  category(),
                                  category(),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                //spaceevenly
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  category(),
                                  category(),
                                  category(),
                                  category(),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                //spaceevenly
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  category(),
                                  category(),
                                  category(),
                                  category(),
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
                          height: 200.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
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
                        padding: const EdgeInsets.all(16.0),
                        child: TitleText(text: 'Trif Switches'),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                //spaceevenly
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  category(),
                                  category(),
                                  category(),
                                  category(),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                //spaceevenly
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  category(),
                                  category(),
                                  category(),
                                  category(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TitleText(text: 'Trifs Vodcasts'),
                      ),
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
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
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
                                        overflow: TextOverflow.ellipsis),
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TitleText(text: 'Recommended Packages'),
                      ),
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
                                      'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack topAttractions() {
    return Stack(
      children: [
        Container(
          //background image
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 10.h,
            child: Container(
              color: Colors.yellow,
              child: Text('ernakulam'),
            ))
      ],
    );
  }

  Container category() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on,
            color: Colors.black,
          ),
          Text(
            'Calicut',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
