// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:trip_calicut/screens/tours/singlepage/toursinglepage.dart';
// import 'package:trip_calicut/screens/tours/singlepage/toursinglepagemodel.dart';


// class TourSinglePageController extends GetxController {
//   // final packageData = Rx<List<Package>>([]);
//   // final packageData = Rx<List<Package>>([]);
//   //Package not a list
//   final tourData = Rx<Place>(Place());
//   final isLoading = Rx<bool>(false);
  

//   @override
//   void onInit() {
//     super.onInit();
//     fetchTourData();
//   }

//   Future fetchTourData() async {
//     try {
//       isLoading.value = true;
//       var response = await TourSinglePage.fetchTourData(api: 'places/');
//       var jsonResponse = json.decode(response);
//       var tourSinglePageModel =
//           TourSinglePageModel.fromJson(jsonResponse);
//       tourData.value = tourSinglePageModel.place!;
//       isLoading.value = false;
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }



