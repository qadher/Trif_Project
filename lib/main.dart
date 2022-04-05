import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/bottom_navigation/navigation.dart';
import 'package:trip_calicut/screens/home/homescreen.dart';
import 'package:trip_calicut/screens/homestay/homestayscreen.dart';
import 'package:trip_calicut/screens/houseboat/houseboatscreen.dart';
import 'package:trip_calicut/screens/resort/resortscreen.dart';
import 'package:trip_calicut/screens/splash_screen/splash_screen.dart';
import 'package:trip_calicut/screens/tours/tourscreen.dart';
import 'package:trip_calicut/screens/travel/travelscreen.dart';
import 'package:trip_calicut/screens/trekking/trekkingscreen.dart';

const status = 'first_time';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: Colors.transparent, primary: Colors.blue),
        ),
        home: SplashScreen(),
      );
    });
  }
}
