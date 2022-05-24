import 'package:hive/hive.dart';
part 'db_model.g.dart';

@HiveType(typeId: 0)
class TrifsDB extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String type;
  @HiveField(2)
  String image;
  @HiveField(3)
  String title;
  @HiveField(4)
  String desc;

  TrifsDB(
      {required this.id,
      required this.type,
      required this.image,
      required this.title,
      required this.desc});
}
