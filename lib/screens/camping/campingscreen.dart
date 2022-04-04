import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/components/packagecard.dart';
import 'package:trip_calicut/components/viewall.dart';
import 'package:trip_calicut/screens/camping/Components/camping_list_card.dart';
import 'package:trip_calicut/screens/home/components/carousel.dart';

import '../home/components/titletext.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../widgets.dart';

class CampingScreen extends StatelessWidget {
  const CampingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(
          title: 'Camping',
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: false,
                              viewportFraction: 1),
                          items: imageSlidersBanner,
                        ),
                      ),
                 heightSizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ViewAll(text: 'Providers'),
                ),
                heightSizedBox(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                        widthSizedBox(),
                        providerCard(),
                      ],
                    ),
                  ),
                ),
                heightSizedBox(),

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
                  padding: const EdgeInsets.only(left: 8),
                  child: TitleText(text: 'Results from Ollur...'),
                ),
                heightSizedBox(),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CampingListCard(),
                  ),
                )
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
              border: Border.all(width: 0.8,color: Colors.white),
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
              border: Border.all(width: 0.8,color: Colors.white),
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