import 'dart:convert';

import 'package:get/get.dart';

import '../models/packageapicard.dart';
import '../services/service.dart';

class PackageApiCardController extends GetxController {
  final packageData = Rx<List<Packages>>([]);
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
      var response = await ApiManager.fetchData(api: 'packages');
      var jsonResponse = json.decode(response);
      var packageApiCard = PackageApiCard.fromJson(jsonResponse);
      packageData.value = packageApiCard.packages!;
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
