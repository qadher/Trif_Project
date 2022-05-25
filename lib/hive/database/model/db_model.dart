import 'package:hive/hive.dart';
part 'db_model.g.dart';

@HiveType(typeId: 0)
class TrifsDB  extends HiveObject{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? type;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? title;
  @HiveField(4)
  String? desc;
  @HiveField(5)
  bool? fav;

  TrifsDB(
      {this.id,
      this.type,
      this.image,
      this.title,
       this.desc,
       this.fav});
}
