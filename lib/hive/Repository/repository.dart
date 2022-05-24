
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trip_calicut/hive/database/model/db_model.dart';

class RepositoryBox{

    static const dataBox = 'boxname';

  
  static openBox() async => await Hive.openBox<TrifsDB>(dataBox);

  static Box getBox() => Hive.box<TrifsDB>(dataBox);

  static closeBox() async => await Hive.box(dataBox).close(); 
}