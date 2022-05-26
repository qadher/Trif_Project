import 'dart:convert';

import 'package:get/get.dart';
import 'package:trip_calicut/screens/houseboat/components/agencycard.dart';
import 'package:trip_calicut/screens/houseboat/singlepage/package/model/houseboatpackagemodel.dart';

import '../services/service.dart';

class AgencySinglePageController extends GetxController {
  final agencySingleData = Rx<List<Agency>>([]);
  final isLoading = Rx<bool>(false);


  @override
  void onInit() {
    super.onInit();
    fetchAgencyData();
  }

  Future fetchAgencyData() async {
    try {
      for (var i = 0; i < listHouseboatId.length; i++) {
        isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'houseboat/${listHouseboatId[i]}');
      var jsonResponse = json.decode(response);
      var houseBoatPackageModel = HouseBoatPackageModel.fromJson(jsonResponse);
      agencySingleData.value = houseBoatPackageModel.agency as List<Agency>;
      isLoading.value = false;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

 
  }
}
