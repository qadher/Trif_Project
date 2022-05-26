import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/bottom_navigation/navigation.dart';
import 'package:trip_calicut/hive/Repository/repository.dart';
import 'package:trip_calicut/hive/database/model/db_model.dart';
import 'package:trip_calicut/screens/camping/singlepage/campingsinglepage.dart';
import 'package:trip_calicut/screens/home/attractionsinglepage/attractionsinglepage.dart';
import 'package:trip_calicut/screens/home/homeinnerscreen.dart';
import 'package:trip_calicut/screens/home/homescreen.dart';
import 'package:trip_calicut/screens/home/homesinglepage/homesinglepagepackage.dart';
import 'package:trip_calicut/screens/home/webviewsinglepage.dart';
import 'package:trip_calicut/screens/homestay/homestayscreen.dart';
import 'package:trip_calicut/screens/homestay/singlepage/homestaysinglepage.dart';
import 'package:trip_calicut/screens/houseboat/houseboatinnerscreen.dart';
import 'package:trip_calicut/screens/houseboat/houseboatscreen.dart';
import 'package:trip_calicut/screens/houseboat/singlepage/agencysinglepages.dart';
import 'package:trip_calicut/screens/houseboat/singlepage/package/houseboatpackagesinglepage.dart';
import 'package:trip_calicut/screens/jobs/job_screen.dart';
import 'package:trip_calicut/screens/jobs/job_screen_inner.dart';
import 'package:trip_calicut/screens/login_screen/login_screen.dart';
import 'package:trip_calicut/screens/onboarding/onboarding.dart';
import 'package:trip_calicut/screens/places/components/placesdistrict.dart';
import 'package:trip_calicut/screens/resort/resortscreen.dart';
import 'package:trip_calicut/screens/resort/singlepage/resortsinglepage.dart';
import 'package:trip_calicut/screens/sign_up/signup.dart';
import 'package:trip_calicut/screens/singlepages/agencysinglepage.dart';
import 'package:trip_calicut/screens/singlepages/campingsinglepage.dart';
import 'package:trip_calicut/screens/singlepages/packagesinglepage.dart';
import 'package:trip_calicut/screens/splash_screen/splash_screen.dart';
import 'package:trip_calicut/screens/tours/placeslistpage.dart';
import 'package:trip_calicut/screens/tours/singlepage/toursinglepage.dart';
import 'package:trip_calicut/screens/tours/tourscreen.dart';
import 'package:trip_calicut/screens/tours/tourscreen_inner.dart';
import 'package:trip_calicut/screens/travel/singlepage/travelsinglepagepackage.dart';
import 'package:trip_calicut/screens/travel/travelscreen.dart';
import 'package:trip_calicut/screens/trekking/singlepage/truckingsinglepage.dart';
import 'package:trip_calicut/screens/trekking/trekkingscreen.dart';
import 'package:permission_handler/permission_handler.dart';

const status = 'first_time';
void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(TrifsDBAdapter());
  await RepositoryBox.openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        // initialBinding: InitBindings(),
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: Colors.transparent, primary: Colors.blue),
        ),
        home: SplashScreen(),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => MyApp()),
          GetPage(name: '/bottomNav', page: () => App()),
          GetPage(name: '/home', page: () => HomeScreen()),
          GetPage(name: '/tour', page: () => TourScreen()),
          GetPage(name: '/travel', page: () => TravelScreen()),
          GetPage(name: '/trekking', page: () => TrekkingScreen()),
          GetPage(name: '/resort', page: () => ResortScreen()),
          GetPage(name: '/houseboat', page: () => HouseBoatScreen()),
          GetPage(name: '/homestay', page: () => HomeStayScreen()),
          GetPage(name: '/login', page: () => LoginScreen()),
          GetPage(name: '/onboarding', page: () => OnBoardingScreen()),
          GetPage(name: '/signup', page: () => SignUpScreen()),
          GetPage(name: '/singlepage', page: () => TourInnerScreen()),
          GetPage(name: '/jobsinglepage', page: () => JobInnerScreen()),
          GetPage(name: '/jobs', page: () => JobScreen()),
          GetPage(name: '/homesinglepage', page: () => HomeInnerScreen()),
          // GetPage(
          //     name: '/houseboatsinglepage', page: () => HouseBoatInnerScreen()),
          GetPage(name: '/packagesinglepage', page: () => PackageSinglePage()),
          GetPage(name: '/campingsinglepage', page: () => CampingSinglePage()),
          GetPage(name: '/homesinglepagepackage', page: () => HomeSinglePagePackage()),
          GetPage(name: '/resortsinglepage', page: () => ResortSinglePagePackage()),
          GetPage(name: '/homestaysinglepage', page: () => HomeStaySinglePagePackage()),
          GetPage(name: '/toursinglepage', page: () => TourSinglePagePackage()),
          GetPage(name: '/truckingsinglepage', page: () => TruckingSinglePagePackage()),
          GetPage(name: '/attractionsinglepage', page: () => AttractionSinglePage()),
          GetPage(name: '/houseboatpackagesinglepage', page: () => HouseBoatPackageSinglePage()),
          GetPage(name: '/placeslistpage', page: () => PlacesListPage()),
          GetPage(name: '/keralaplaces', page: () => KeralaPlaces()),
          GetPage(name: '/campingsinglepagepackage', page: () => CampingSinglePagePackage()),
          GetPage(name: '/travelsinglepagepackage', page: () => TravelSinglePagePackage()),
          GetPage(name: '/trip-switches-webview', page: () => WebViewSinglePage()),
          GetPage(name: '/agencysinglepage', page: () => AgencySinglePages()),
          
        ],
      );
    });
  }
}
