import 'dart:convert';

import 'package:get/get.dart';

import '../models/attractionapicard.dart';
import '../models/homestaypackageapicard.dart';
import '../models/keraladistrictcard.dart';
import '../models/packageapicard.dart';
import '../models/resortapicard.dart';
import '../services/service.dart';

class HomeStayPackageApiCardController extends GetxController {
  final homeStayData = Rx<List<Homestays>>([]);
  final isLoading = Rx<bool>(false);


  @override
  void onInit() {
    super.onInit();
    fetchHomeStayPackageData();
  }

  Future fetchHomeStayPackageData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'homestay');
      var jsonResponse = json.decode(response);
      var homeStayPackageApiCard = HomeStayPackageApiCard.fromJson(jsonResponse);
      homeStayData.value = homeStayPackageApiCard.homestays!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

  
  }
}
