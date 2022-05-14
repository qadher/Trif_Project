import 'dart:convert';

import 'package:get/get.dart';
import 'package:trip_calicut/models/campingapicard.dart';
import 'package:trip_calicut/screens/home/components/packagecard.dart';

import '../models/packageapicard.dart';
import '../services/service.dart';

class CampingApiCardController extends GetxController {
  final campingData = Rx<List<Camping>>([]);
  final isLoading = Rx<bool>(false);

  //List districtData = [].obs;
  //var districtData = List<Cast>().obs;
  // var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCampingData();
  }

  Future fetchCampingData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'camping');
      var jsonResponse = json.decode(response);
      var campingApiCard = CampingApiCard.fromJson(jsonResponse);
      campingData.value = campingApiCard.camping!;
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
