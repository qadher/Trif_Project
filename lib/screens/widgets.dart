import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'home/components/carousel.dart';

Container adsBanner(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.3,
    width: MediaQuery.of(context).size.width,
    child: CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        // autoPlay: false,
      ),
      items: adsList
          .map((item) => Container(
                child: Center(
                    child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                )),
              ))
          .toList(),
    ),
  );
}

final List<String> adsList = [
  'assets/images/ads.png',
  'assets/images/ads.png',
  'assets/images/ads.png',
];
