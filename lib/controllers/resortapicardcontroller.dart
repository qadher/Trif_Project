import 'dart:convert';

import 'package:get/get.dart';

import '../models/attractionapicard.dart';
import '../models/keraladistrictcard.dart';
import '../models/packageapicard.dart';
import '../models/resortapicard.dart';
import '../services/service.dart';

class ResortApiCardController extends GetxController {
  final resortData = Rx<List<Resorts>>([]);
  final isLoading = Rx<bool>(false);


  @override
  void onInit() {
    super.onInit();
    fetchResortData();
  }

  Future fetchResortData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'resorts');
      var jsonResponse = json.decode(response);
      var resortApiCard = ResortApiCard.fromJson(jsonResponse);
      resortData.value = resortApiCard.resorts!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

  
  }
}
