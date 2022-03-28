import 'package:flutter/material.dart';
import 'package:trip_calicut/bottom_navigation/tab_item.dart';


class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}
class TabNavigator extends StatelessWidget {
  const TabNavigator({ Key? key,required this.navigatorKey, required this.tabItem }) : super(key: key);
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

   void _push(BuildContext context, {int materialIndex: 0}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.detail]!(context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 0}) {
    return {
      TabNavigatorRoutes.root: (context) => roots[tabItem]!,
      // TabNavigatorRoutes.root: (context) => ColorsListPage(
      //       color: activeTabColor[tabItem]!,
      //       title: tabName[tabItem]!,
      //       onPush: (materialIndex) =>
      //           _push(context, materialIndex: materialIndex),
      //     ),
      // TabNavigatorRoutes.detail: (context) => ColorDetailsPage(
      //       color: activeTabColor[tabItem]!,
      //       title: tabName[tabItem]!,
      //       materialIndex: materialIndex,
      //     ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}