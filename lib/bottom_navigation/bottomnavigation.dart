import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trip_calicut/bottom_navigation/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.home),
        _buildItem(tabItem: TabItem.search),
        _buildItem(tabItem: TabItem.favorite),
        _buildItem(tabItem: TabItem.offer),
        _buildItem(tabItem: TabItem.profile),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      // selectedItemColor: activeTabColor[currentTab]!,
    );
  }

  BottomNavigationBarItem _buildItem({TabItem? tabItem}) {
    String? icon = tabIcon[tabItem];

    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        tabIcon[tabItem]!,
        height: 26.h,
        width: 25.w,
        // color: Colors.grey,
      ),
      label: tabName[tabItem],
    );
  }
}
