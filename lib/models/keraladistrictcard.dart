import 'dart:convert';

KeralaDistrictCard keralaDistrictCardFromJson(String str) =>
    KeralaDistrictCard.fromJson(json.decode(str));
String keralaDistrictCardToJson(KeralaDistrictCard data) =>
    json.encode(data.toJson());

class KeralaDistrictCard {
  String? sts;
  String? msg;
  List<Places>? places;

  KeralaDistrictCard({this.sts, this.msg, this.places});

  KeralaDistrictCard.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(new Places.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.places != null) {
      data['places'] = this.places!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Places {
  int? id;
  String? name;
  String? subName;
  String? placeCode;
  String? duration;
  String? image;

  Places(
      {this.id,
      this.name,
      this.subName,
      this.placeCode,
      this.duration,
      this.image});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subName = json['sub_name'];
    placeCode = json['place_code'];
    duration = json['duration'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sub_name'] = this.subName;
    data['place_code'] = this.placeCode;
    data['duration'] = this.duration;
    data['image'] = this.image;
    return data;
  }
}
