import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/screens/home/components/packagecard.dart';
import 'package:trip_calicut/components/viewall.dart';
import 'package:trip_calicut/screens/camping/Components/camppackagecard.dart';
import 'package:trip_calicut/screens/home/components/carousel.dart';

import '../home/components/titletext.dart';
import '../tours/components/AppBarWidget.dart';
import '../../widgets.dart';
import '../widgets.dart';

class CampingScreen extends StatelessWidget {
  const CampingScreen({Key? key}) : super(key: key);

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
                  height: 20.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                  child: TitleText(text: 'Providers'),
                ),
                heightSizedBox(),
                Container(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage:
                                    AssetImage('assets/images/background.jpg'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('kannur')
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 2,
                      );
                    },
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
                    height: 10,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CampPackageCard()
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
            height: 80,
            width: 130,
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
                width: 130,
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
          height: 10,
        ),
        Stack(children: [
          Container(
            height: 80,
            width: 130,
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
                width: 130,
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
