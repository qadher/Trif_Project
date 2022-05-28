import 'dart:convert';

import 'package:get/get.dart';
import 'package:trip_calicut/models/tourcategoriesmodel.dart';

import '../services/service.dart';

class TourCategoriesController extends GetxController {
  final categoriesData = Rx<List<Category>>([]);
  final isLoading = Rx<bool>(false);

  //List districtData = [].obs;
  //var districtData = List<Cast>().obs;
  // var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDistrictData();
  }

  Future fetchDistrictData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'packages/categories');
      var jsonResponse = json.decode(response);
      var tourCategoriesModel = TourCategoriesModel.fromJson(jsonResponse);
      categoriesData.value = tourCategoriesModel.categories!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

   
  }
}
