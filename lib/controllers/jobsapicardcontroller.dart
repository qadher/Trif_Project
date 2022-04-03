import 'dart:convert';

import 'package:get/get.dart';

import '../models/jobsapicard.dart';
import '../services/service.dart';

class JobsApiCardController extends GetxController {
  final jobsData = Rx<List<Jobs>>([]);
  final isLoading = Rx<bool>(false);

  @override
  void onInit() {
    super.onInit();
    fetchjobsData();
  }

  Future fetchjobsData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'jobs');
      var jsonResponse = json.decode(response);
      var jobsApiCard = JobsApiCard.fromJson(jsonResponse);
      jobsData.value = jobsApiCard.jobs!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
