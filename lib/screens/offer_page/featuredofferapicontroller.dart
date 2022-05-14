import 'dart:convert';

import 'package:get/get.dart';
import 'package:trip_calicut/screens/offer_page/featuredoffersmodel.dart';

import '../../services/service.dart';



class FeaturedofferApiController extends GetxController {
  final featuredOfferData = Rx<List<Featured>>([]);
  final isLoading = Rx<bool>(false);


  @override
  void onInit() {
    super.onInit();
    fetchFeaturedOfferData();
  }

  Future fetchFeaturedOfferData() async {
    try {
      isLoading.value = true;
      var response = await ApiManager.fetchData(api: 'featured/offers');
      var jsonResponse = json.decode(response);
      var featuredOffersModel = FeaturedOffersModel.fromJson(jsonResponse);
      featuredOfferData.value = featuredOffersModel.featured!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }

 
  }
}
