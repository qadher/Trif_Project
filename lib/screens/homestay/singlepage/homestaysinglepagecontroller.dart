// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:trip_calicut/screens/homestay/singlepage/homestayamenitiesmodel.dart';
// import 'package:trip_calicut/screens/homestay/singlepage/homestaysinglepage.dart';
// import 'package:trip_calicut/screens/homestay/singlepage/homestaysinglepagemodel.dart';
// import 'package:trip_calicut/screens/resort/singlepage/placesgallerymodel.dart';
// import 'package:trip_calicut/screens/resort/singlepage/superdeluxroommodel.dart';

// import '../../../../services/service.dart';

// class HomeStaySinglePageController extends GetxController {
//   // final packageData = Rx<List<Package>>([]);
//   // final packageData = Rx<List<Package>>([]);
//   //Package not a list
//   final homeStayData = Rx<Homestay>(Homestay());
//   final isLoading = Rx<bool>(false);
  

//   @override
//   void onInit() {
//     super.onInit();
//     fetchHomeStayData();
//   }

//   Future fetchHomeStayData() async {
//     try {
//       isLoading.value = true;
//       var response = await HomeStaySinglePage.fetchHomeStayData(api: 'homestay/');
//       var jsonResponse = json.decode(response);
//       var homeStaySinglePageModel =
//           HomeStaySinglePageModel.fromJson(jsonResponse);
//       homeStayData.value = homeStaySinglePageModel.homestay!;
//       isLoading.value = false;
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }



// class HomeStayAmenitiesController extends GetxController {
//   final amenitiesData = Rx<List<Amenities>>([])  ;
//   final isLoading = Rx<bool>(false);

//   @override
//   void onInit() {
//     super.onInit();
//     fetchAmenitiesData();
//   }

//   Future fetchAmenitiesData() async {
//     try {
//       isLoading.value = true;
//       var response = await ApiManager.fetchData(api: 'homestay/amenities/6');
//       var jsonResponse = json.decode(response);
//       var homeStayAmenitiesModel = HomeStayAmenitiesModel.fromJson(jsonResponse);
//       amenitiesData.value = homeStayAmenitiesModel.amenities!;
//       isLoading.value = false;
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

