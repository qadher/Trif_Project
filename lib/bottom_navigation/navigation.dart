import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_calicut/bottom_navigation/bottomnavigation.dart';
import 'package:trip_calicut/bottom_navigation/tab_item.dart';
import 'package:trip_calicut/bottom_navigation/tab_navigator.dart';
import 'package:trip_calicut/screens/favorites/favorite_screen.dart';
import 'package:trip_calicut/screens/home/homescreen.dart';
import 'package:trip_calicut/screens/offer_page/offerPage.dart';
import 'package:trip_calicut/screens/profile/profilepage.dart';
import 'package:trip_calicut/screens/search_page/search_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedPage = 0;

  final _pageOptions = [
    HomeScreen(),
    SearchPage(),
    Favorites(),
    OfferScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/bottom_icons/home color.svg',
                  height: 24,
                  width: 24,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/bottom_icons/search vector.svg',
                  height: 24,
                  width: 24,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/bottom_icons/heart color.svg',
                  height: 24,
                  width: 24,
                ),
                label: 'Favorite'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/bottom_icons/discount color.svg',
                  height: 24,
                  width: 24,
                ),
                label: 'Offers'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/bottom_icons/user color.svg',
                  height: 24,
                  width: 24,
                ),
                label: 'Account'),
          ],
          selectedItemColor: Color.fromARGB(255, 5, 114, 168),
          elevation: 5.0,
          unselectedItemColor: Color(0xFF00A6F6),
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
  //   var _currentTab = TabItem.home;
  // final _navigatorKeys = {
  //   TabItem.home: GlobalKey<NavigatorState>(),
  //   TabItem.search: GlobalKey<NavigatorState>(),
  //   TabItem.favorite: GlobalKey<NavigatorState>(),
  //   TabItem.offer: GlobalKey<NavigatorState>(),
  //   TabItem.profile: GlobalKey<NavigatorState>(),
  // };

  // void _selectTab(TabItem tabItem) {
  //   if (tabItem == _currentTab) {
  //     // pop to first route
  //     _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
  //   } else {
  //     setState(() => _currentTab = tabItem);
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: () async {
  //       final isFirstRouteInCurrentTab =
  //           !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
  //       if (isFirstRouteInCurrentTab) {
  //         // if not on the 'main' tab
  //         if (_currentTab != TabItem.home) {
  //           // select 'main' tab
  //           _selectTab(TabItem.home);
  //           // back button handled by app
  //           return false;
  //         }
  //       }
  //       // let system handle back button if we're on the first route
  //       return isFirstRouteInCurrentTab;
  //     },
  //     child: Scaffold(
    
  //       body: Stack(
  //         children: <Widget>[
  //           _buildOffstageNavigator(TabItem.home),
  //           _buildOffstageNavigator(TabItem.search),
  //           _buildOffstageNavigator(TabItem.favorite),
  //           _buildOffstageNavigator(TabItem.offer),
  //           _buildOffstageNavigator(TabItem.profile),
  //         ],
  //       ),
  //        bottomNavigationBar: BottomNavigation(
  //           currentTab: _currentTab,
  //           onSelectTab: _selectTab,
  //         ),
  //     ),
  //   );
  // }
  //  Widget _buildOffstageNavigator(TabItem tabItem) {
  //   return Offstage(
  //     offstage: _currentTab != tabItem,
  //     child: TabNavigator(
  //       navigatorKey: _navigatorKeys[tabItem],
  //       tabItem: tabItem,
  //     ),
  //   );
  // }
