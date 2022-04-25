import 'dart:convert';

import 'package:get/get.dart';
import 'package:trip_calicut/screens/home/homesinglepage/homesinglepagepackage.dart';
import 'package:trip_calicut/screens/home/homesinglepage/packagesinglepagemodel.dart';




class PackageSinglePageController extends GetxController {
  // final packageData = Rx<List<Package>>([]);
  // final packageData = Rx<List<Package>>([]);
  //Package not a list
  final packageData = Rx<Package>(Package());
  final isLoading = Rx<bool>(false);
 
  @override
  void onInit() {
    super.onInit();
    fetchPackageData();
  }

  Future fetchPackageData() async {
    try {
      isLoading.value = true;
      var response = await HomeSinglePagePackage.fetchHomePackageData(api: 'packages/');
      var jsonResponse = json.decode(response);
      var packageSinglePageModel =
          PackageSinglePageModel.fromJson(jsonResponse);
      packageData.value = packageSinglePageModel.package!;
      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
