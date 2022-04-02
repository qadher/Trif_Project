import 'dart:convert';

import 'package:get/get.dart';

import '../models/agencyapi.dart';
import '../services/service.dart';

class AgencyApiController extends GetxController {
  final agencyData = Rx<List<Agency>>([]);
  final isLoading = Rx<bool>(false);


  @override
  void onInit() {
    super.onInit();
    fetchAgencyData();
  }

  Future fetchAgencyData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'agency');
      var jsonResponse = json.decode(response);
      var agencyApi = AgenyApi.fromJson(jsonResponse);
      agencyData.value = agencyApi.agency!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

 
  }
}
