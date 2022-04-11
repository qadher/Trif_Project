import 'dart:convert';

import 'package:get/get.dart';

import '../models/educationapicard.dart';
import '../services/service.dart';

class EducationApiCardController extends GetxController {
  final educationData = Rx<List<Universities>>([]);
  final isLoading = Rx<bool>(false);


  @override
  void onInit() {
    super.onInit();
    fetchEducationData();
  }

  Future fetchEducationData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'universities');
      var jsonResponse = json.decode(response);
      var educationApiCard = EducationApiCard.fromJson(jsonResponse);
      educationData.value = educationApiCard.universities!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

 
  }
}
