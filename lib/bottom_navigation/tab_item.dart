import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_calicut/screens/home/homescreen.dart';

enum TabItem { home, search, favorite, offer, profile }

Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.search: 'Search',
  TabItem.favorite: 'Favorites',
  TabItem.offer: 'Offers',
  TabItem.profile: 'Profile',
};
// Map<TabItem, SvgPicture> tabIcon = {
//   TabItem.home: SvgPicture.asset('assets/bottom_icons/home color.svg'),
//   TabItem.search: SvgPicture.asset('assets/bottom_icons/search vector.svg'),
//   TabItem.favorite: SvgPicture.asset('assets/bottom_icons/heart color.svg'),
//   TabItem.offer: SvgPicture.asset('assets/bottom_icons/discount color.svg'),
//   TabItem.profile: SvgPicture.asset('assets/bottom_icons/user color.svg'),
// };
Map<TabItem, String> tabIcon = {
  TabItem.home: 'assets/bottom_icons/home color.svg',
  TabItem.search: 'assets/bottom_icons/search vector.svg',
  TabItem.favorite: 'assets/bottom_icons/heart color.svg',
  TabItem.offer: 'assets/bottom_icons/discount color.svg',
  TabItem.profile: 'assets/bottom_icons/user color.svg',
};
Map<TabItem, Widget> roots ={
  TabItem.home: HomeScreen(),
  TabItem.search: HomeScreen(),
  TabItem.favorite: HomeScreen(),
  TabItem.offer: HomeScreen(),
  TabItem.profile: HomeScreen(),
};

