import 'dart:convert';

import 'package:get/get.dart';

import '../models/attractionapicard.dart';
import '../models/keraladistrictcard.dart';
import '../models/packageapicard.dart';
import '../models/resortapicard.dart';
import '../models/travelpackageapicard.dart';
import '../services/service.dart';

class TravelPackageApiCardController extends GetxController {
  final travelPackageData = Rx<List<Travels>>([]);
  final isLoading = Rx<bool>(false);


  @override
  void onInit() {
    super.onInit();
    fetchTravelData();
  }

  Future fetchTravelData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'travels');
      var jsonResponse = json.decode(response);
      var travelPackageApiCard = TravelPackageApiCard.fromJson(jsonResponse);
      travelPackageData.value = travelPackageApiCard.travels!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

  
  }
}
