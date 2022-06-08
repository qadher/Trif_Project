import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/api.dart';
import '../../../controllers/tourcategoriescontroller.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({
    Key? key,
    required this.tourCategoriesController,
  }) : super(key: key);

  final TourCategoriesController tourCategoriesController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider.builder(
          itemCount: tourCategoriesController.categoriesData.value.length,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            // viewportFraction: 1,
          ),
          itemBuilder: (BuildContext context, int index, int pageViewIndex) => Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  color: Color.fromARGB(255, 192, 192, 192),
                  child: tourCategoriesController.categoriesData.value[index].image!.isEmpty ||
                          tourCategoriesController.categoriesData.value[index].image == null
                      ? Image.asset('assets/images/no_image/noimage_landscape.jpeg', fit: BoxFit.cover, width: 1000.0)
                      : CachedNetworkImage(
                          imageUrl: Api.imageUrl + '${tourCategoriesController.categoriesData.value[index].image}',
                          fit: BoxFit.cover,
                          width: 1000.0),
                )),
          ),
        ));
  }
}
