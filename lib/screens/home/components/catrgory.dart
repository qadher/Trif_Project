

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../camping/campingscreen.dart';
import '../../homestay/homestayscreen.dart';
import '../../houseboat/houseboatscreen.dart';
import '../../places/placescreen.dart';
import '../../resort/resortscreen.dart';
import '../../tours/tourscreen.dart';
import '../../travel/travelscreen.dart';
import '../../trekking/trekkingscreen.dart';

class Category extends StatelessWidget {
  final List categoryname;
  Category({
    Key? key,
    required this.categoryname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        children: List.generate(
          categoryname.length,
          (index) => CategoryCard(
            categoryList: categoryname[index],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryList categoryList;

  CategoryCard({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => categoryList.screen,
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              categoryList.image,
              height: 45.h,
              width: 45.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              categoryList.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontFamily: 'Lato',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryList {
  final String image;
  final String title;
  Widget screen;

  CategoryList(
      {required this.screen, required this.image, required this.title});
}

List<CategoryList> categoryLists = <CategoryList>[
  CategoryList(
      image: 'assets/icons/tours.svg', title: 'Tours', screen: TourScreen()),
  CategoryList(
      image: 'assets/icons/houseboat.svg',
      title: 'House Boat',
      screen: HouseBoatScreen()),
  CategoryList(
      image: 'assets/icons/places.svg', title: 'Places', screen: PlaceScreen()),
  CategoryList(
      image: 'assets/icons/camping.svg',
      title: 'Camping',
      screen: CampingScreen()),
  CategoryList(
      image: 'assets/icons/resort.svg',
      title: 'Resort',
      screen: ResortScreen()),
  CategoryList(
      image: 'assets/icons/travel.svg',
      title: 'Travel',
      screen: TravelScreen()),
  CategoryList(
      image: 'assets/icons/blindspot.svg',
      title: 'Blind Spot',
      screen: TourScreen()),
  CategoryList(
      image: 'assets/icons/globaltravel.svg',
      title: 'Global Travel',
      screen: TourScreen()),
  CategoryList(
      image: 'assets/icons/trekking.svg',
      title: 'Trekking',
      screen: TrekkingScreen()),
  CategoryList(
      image: 'assets/icons/homestay.svg',
      title: 'Homestay',
      screen: HomeStayScreen()),
  CategoryList(
      image: 'assets/icons/education.svg',
      title: 'Education',
      screen: TourScreen()),
  CategoryList(
      image: 'assets/icons/jobs.svg', title: 'Jobs', screen: TourScreen()),
];

List<CategoryList> trifSwitches = <CategoryList>[
  CategoryList(
      image: 'assets/icons/tours.svg', title: 'Tours', screen: TourScreen()),
  CategoryList(
      image: 'assets/icons/houseboat.svg',
      title: 'House Boat',
      screen: HouseBoatScreen()),
  CategoryList(
      image: 'assets/icons/places.svg', title: 'Places', screen: PlaceScreen()),
  CategoryList(
      image: 'assets/icons/camping.svg',
      title: 'Camping',
      screen: CampingScreen()),
  CategoryList(
      image: 'assets/icons/resort.svg',
      title: 'Resort',
      screen: ResortScreen()),
  CategoryList(
      image: 'assets/icons/travel.svg',
      title: 'Travel',
      screen: TravelScreen()),
  CategoryList(
      image: 'assets/icons/blindspot.svg',
      title: 'Blind Spot',
      screen: TourScreen()),
  CategoryList(
      image: 'assets/icons/globaltravel.svg',
      title: 'Global Travel',
      screen: TourScreen()),
];
