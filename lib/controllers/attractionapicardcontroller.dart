import 'dart:convert';

import 'package:get/get.dart';

import '../models/attractionapicard.dart';
import '../models/keraladistrictcard.dart';
import '../services/service.dart';

class AttractionApiCardController extends GetxController {
  final attractionData = Rx<List<Attractions>>([]);
  final isLoading = Rx<bool>(false);

  //List districtData = [].obs;
  //var districtData = List<Cast>().obs;
  // var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAttractionData();
  }

  Future fetchAttractionData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchDistrictData('attractions');
      var jsonResponse = json.decode(response);
      var attractionApiCard = AttractionApiCard.fromJson(jsonResponse);
      attractionData.value = attractionApiCard.attractions!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

    // try {
    //   isLoading.value = true;
    //   var data = await ApiManager.fetchDistrictData();
    //   if(data != null) {
    //     districtData = json.decode(data);
    //     isLoading.value = false;
    //   }
    // } catch (e) {
    //   print("Failed to fetch data $e");
    // } finally {
    //   isLoading.value = false;
    // }
  }
}
