import 'dart:convert';

import 'package:get/get.dart';

import '../models/keraladistrictcard.dart';
import '../services/service.dart';

class KeralaDistrictCardController extends GetxController {
  final districtData = Rx<List<Places>>([]);
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
      var response = await ApiManager.fetchDistrictData('places');
      var jsonResponse = json.decode(response);
      var keralaDistrictCard = KeralaDistrictCard.fromJson(jsonResponse);
      districtData.value = keralaDistrictCard.places!;
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

// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:trip_calicut/services/service.dart';

// class KeralaDistrictCardController extends GetxController {
//   List districtData = [].obs;
//   var isLoading = true.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchDistrictData();
//   }

//   Future fetchDistrictData() async {
//     try {
//       isLoading.value = true;
//       var data = await ApiManager.fetchDistrictData();
//       if(data != null) {
//         districtData = json.decode(data);
//         isLoading.value = false;
//       }
//     } catch (e) {
//       print("Failed to fetch data $e");
//     } finally {
//       isLoading.value = false;
//     }
//   } 
// }