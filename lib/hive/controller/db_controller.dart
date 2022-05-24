

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trip_calicut/hive/Repository/repository.dart';

class DBController extends GetxController{

  final Box observableBox = RepositoryBox.getBox();
}