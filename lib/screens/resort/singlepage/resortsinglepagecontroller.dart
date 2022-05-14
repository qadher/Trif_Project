// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:trip_calicut/screens/resort/singlepage/placesgallerymodel.dart';
// import 'package:trip_calicut/screens/resort/singlepage/resortAmenitiesmodel.dart';
// import 'package:trip_calicut/screens/resort/singlepage/resortsinglepage.dart';
// import 'package:trip_calicut/screens/resort/singlepage/resortsinglepagemodel.dart';
// import 'package:trip_calicut/screens/resort/singlepage/superdeluxroommodel.dart';

// import '../../../../services/service.dart';

// class ResortSinglePageController extends GetxController {
//   // final packageData = Rx<List<Package>>([]);
//   // final packageData = Rx<List<Package>>([]);
//   //Package not a list
//   final resortData = Rx<Resort>(Resort());
//   final isLoading = Rx<bool>(false);
  

//   @override
//   void onInit() {
//     super.onInit();
//     fetchPackageData();
//   }

//   Future fetchPackageData() async {
//     try {
//       isLoading.value = true;
//       var response = await ResortSinglePage.fetchResortData(api: 'resorts/');
//       var jsonResponse = json.decode(response);
//       var resortSinglePageModel =
//           ResortSinglePageModel.fromJson(jsonResponse);
//       resortData.value = resortSinglePageModel.resort!;
//       isLoading.value = false;
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }



// class ResortAmenitiesController extends GetxController {
//   final amenitiesData = Rx<List<Amenities>>([]);
//   final isLoading = Rx<bool>(false);

//   @override
//   void onInit() {
//     super.onInit();
//     fetchAmenitiesData();
//   }

//   Future fetchAmenitiesData() async {
//     try {
//       isLoading.value = true;
//       var response = await ApiManager.fetchData(api: 'resorts/amenities/7');
//       var jsonResponse = json.decode(response);
//       var resortAmenitiesModel = ResortAmenitiesModel.fromJson(jsonResponse);
//       amenitiesData.value = resortAmenitiesModel.amenities!;
//       isLoading.value = false;
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class PlaceGalleryController extends GetxController {
//   final galleryData = Rx<List<Images>>([]);
//   final isLoading = Rx<bool>(false);

//   @override
//   void onInit() {
//     super.onInit();
//     fetchGalleryData();
//   }

//   Future fetchGalleryData() async {
//     try {
//       isLoading.value = true;
//       var response = await ApiManager.fetchData(api: 'places/gallery/1');
//       var jsonResponse = json.decode(response);
//       var placesGalleryModel = PlacesGalleryModel.fromJson(jsonResponse);
//       galleryData.value = placesGalleryModel.images!;
//       isLoading.value = false;
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class SuperDeluxRoomController extends GetxController {
//   final roomsData = Rx<List<Rooms>>([]);
//   final isLoading = Rx<bool>(false);

//   @override
//   void onInit() {
//     super.onInit();
//     fetchRoomsData();
//   }

//   Future fetchRoomsData() async {
//     try {
//       isLoading.value = true;
//       var response = await ApiManager.fetchData(api: 'resorts/rooms/7');
//       var jsonResponse = json.decode(response);
//       var superDeluxRoomModel = SuperDeluxRoomModel.fromJson(jsonResponse);
//       roomsData.value = superDeluxRoomModel.rooms!;
//       isLoading.value = false;
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }