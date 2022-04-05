import 'dart:convert';

import 'package:get/get.dart';

import '../models/attractionapicard.dart';
import '../models/keraladistrictcard.dart';
import '../models/packageapicard.dart';
import '../models/resortapicard.dart';
import '../models/travelpackageapicard.dart';
import '../models/truckingpackageapicard.dart';
import '../services/service.dart';

class TruckingPackageApiCardController extends GetxController {
  final truckingPackageData = Rx<List<Trucking>>([]);
  final isLoading = Rx<bool>(false);


  @override
  void onInit() {
    super.onInit();
    fetchTruckingData();
  }

  Future fetchTruckingData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'trucking');
      var jsonResponse = json.decode(response);
      var treckingPackageApiCard = TruckingPackageApiCard.fromJson(jsonResponse);
      truckingPackageData.value = treckingPackageApiCard.trucking!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

  
  }
}
