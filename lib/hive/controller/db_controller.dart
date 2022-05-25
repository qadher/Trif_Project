import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trip_calicut/hive/Repository/repository.dart';
import 'package:trip_calicut/hive/database/model/db_model.dart';

class DBController extends GetxController {
  final Box observableBox = RepositoryBox.getBox();

  updateFav({required TrifsDB item,required String name}) {
    List<String> recentlist = [];
    List<dynamic> _favlist = observableBox.values.toList();
    // print(_favlist);
    _favlist.forEach((element) {
      recentlist.add(element.title);
    });
    if (!recentlist.contains(item.title)) {
      observableBox.add(item);
      Get.snackbar('', 'Addedddd', snackPosition: SnackPosition.BOTTOM);
      update();
    } else {
      // Get.snackbar('', 'Already in list', snackPosition: SnackPosition.BOTTOM);
      final itemtoRemove = observableBox.values.firstWhere((element) => element.title == name);
      itemtoRemove.delete();
      update();
      
    }
  }

  removeFav({required int index}) {
    observableBox.deleteAt(index);
    update();
  }

  IconData updateIcon({required String name}) {
    List<String> inlist = [];
    List<dynamic> _checklist = observableBox.values.toList();
    _checklist.forEach((element) {
      inlist.add(element.title);
    });
    if(inlist.contains(name)){
      return Icons.favorite;
    }
    else{
      return Icons.favorite_outline;
    }
  }
}
