import 'dart:convert';

import 'package:get/get.dart';
import 'package:trip_calicut/screens/offer_page/offersmodel.dart';

import '../../services/service.dart';



class OffersApiController extends GetxController {
  final offersData = Rx<List<Offer>>([]);
  final isLoading = Rx<bool>(false);


  @override
  void onInit() {
    super.onInit();
    fetchOffersData();
  }

  Future fetchOffersData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'offers');
      var jsonResponse = json.decode(response);
      var offersModel = OffersModel.fromJson(jsonResponse);
      offersData.value = offersModel.offers!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

 
  }
}
