import 'package:flutter/material.dart';
import 'package:trip_calicut/bottom_navigation/bottomnavigation.dart';
import 'package:trip_calicut/bottom_navigation/tab_item.dart';
import 'package:trip_calicut/bottom_navigation/tab_navigator.dart';


class App extends StatefulWidget {
  const App({ Key? key }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

    var _currentTab = TabItem.home;
  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.favorite: GlobalKey<NavigatorState>(),
    TabItem.offer: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.home) {
            // select 'main' tab
            _selectTab(TabItem.home);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
    
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.search),
            _buildOffstageNavigator(TabItem.favorite),
            _buildOffstageNavigator(TabItem.offer),
            _buildOffstageNavigator(TabItem.profile),
          ],
        ),
         bottomNavigationBar: BottomNavigation(
            currentTab: _currentTab,
            onSelectTab: _selectTab,
          ),
      ),
    );
  }
   Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}