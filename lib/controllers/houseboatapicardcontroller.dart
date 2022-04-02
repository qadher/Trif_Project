import 'dart:convert';

import 'package:get/get.dart';

import '../models/houseboatapicard.dart';
import '../models/keraladistrictcard.dart';
import '../services/service.dart';

class HouseboatApiCardController extends GetxController {
  final houseBoatData = Rx<List<Houseboats>>([]);
  final isLoading = Rx<bool>(false);


  @override
  void onInit() {
    super.onInit();
    fetchHouseBoatData();
  }

  Future fetchHouseBoatData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'houseboat');
      var jsonResponse = json.decode(response);
      var houseBoatApiCard = HouseBoatApiCard.fromJson(jsonResponse);
      houseBoatData.value = houseBoatApiCard.houseboats!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

 
  }
}
