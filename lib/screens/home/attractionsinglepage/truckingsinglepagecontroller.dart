import 'dart:convert';

import 'package:get/get.dart';
import 'package:trip_calicut/screens/home/attractionsinglepage/attractionsinglepage.dart';
import 'package:trip_calicut/screens/home/attractionsinglepage/attractionsinglepagemodel.dart';
import 'package:trip_calicut/screens/tours/singlepage/toursinglepage.dart';
import 'package:trip_calicut/screens/tours/singlepage/toursinglepagemodel.dart';
import 'package:trip_calicut/screens/trekking/singlepage/truckingsinglepagemodel.dart';


class AttractionSinglePageController extends GetxController {
  // final packageData = Rx<List<Package>>([]);
  // final packageData = Rx<List<Package>>([]);
  //Package not a list
  final attractionData = Rx<Attraction>(Attraction());
  final isLoading = Rx<bool>(false);
  

  @override
  void onInit() {
    super.onInit();
    fetchAttractionData();
  }

  Future fetchAttractionData() async {
    try {
      isLoading.value = true;
      var response = await AttractionSinglePage.fetchAttractionData(api: 'attractions/');
      var jsonResponse = json.decode(response);
      var attracationSinglePageModel =
          AttracationSinglePageModel.fromJson(jsonResponse);
      attractionData.value = attracationSinglePageModel.attraction!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}



