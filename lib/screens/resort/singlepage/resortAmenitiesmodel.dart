import 'dart:convert';

ResortAmenitiesModel resortAmenitiesModelFromJson(String str) => ResortAmenitiesModel.fromJson(json.decode(str));

String resortAmenitiesModelToJson(ResortAmenitiesModel data) => json.encode(data.toJson());

class ResortAmenitiesModel {
  String? sts;
  String? msg;
  List<Amenities>? amenities;

  ResortAmenitiesModel({this.sts, this.msg, this.amenities});

  ResortAmenitiesModel.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['amenities'] != null) {
      amenities = <Amenities>[];
      json['amenities'].forEach((v) {
        amenities!.add(new Amenities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.amenities != null) {
      data['amenities'] = this.amenities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Amenities {
  int? id;
  String? name;
  String? image;
  int? dispOrder;

  Amenities({this.id, this.name, this.image, this.dispOrder});

  Amenities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    dispOrder = json['disp_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['disp_order'] = this.dispOrder;
    return data;
  }
}
