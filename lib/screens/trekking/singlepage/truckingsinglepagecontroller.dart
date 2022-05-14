// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:trip_calicut/screens/tours/singlepage/toursinglepage.dart';
// import 'package:trip_calicut/screens/tours/singlepage/toursinglepagemodel.dart';
// import 'package:trip_calicut/screens/trekking/singlepage/truckingsinglepagemodel.dart';


// class TruckingSinglePageController extends GetxController {
//   // final packageData = Rx<List<Package>>([]);
//   // final packageData = Rx<List<Package>>([]);
//   //Package not a list
//   final truckingData = Rx<Trucking>(Trucking());
//   final isLoading = Rx<bool>(false);
  

//   @override
//   void onInit() {
//     super.onInit();
//     fetchTruckingData();
//   }

//   Future fetchTruckingData() async {
//     try {
//       isLoading.value = true;
//       var response = await TourSinglePage.fetchTourData(api: 'trucking/');
//       var jsonResponse = json.decode(response);
//       var truckingSinglePageModel =
//           TruckingSinglePageModel.fromJson(jsonResponse);
//       truckingData.value = truckingSinglePageModel.trucking!;
//       isLoading.value = false;
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }



