// To parse this JSON data, do
//
//     final attractionApiCard = attractionApiCardFromJson(jsonString);

import 'dart:convert';

AttractionApiCard attractionApiCardFromJson(String str) => AttractionApiCard.fromJson(json.decode(str));

String attractionApiCardToJson(AttractionApiCard data) => json.encode(data.toJson());

class AttractionApiCard {
  String? sts;
  String? msg;
  List<Attractions>? attractions;

  AttractionApiCard({this.sts, this.msg, this.attractions});

  AttractionApiCard.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['attractions'] != null) {
      attractions = <Attractions>[];
      json['attractions'].forEach((v) {
        attractions!.add(new Attractions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.attractions != null) {
      data['attractions'] = this.attractions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attractions {
  int? id;
  String? name;
  String? subName;
  String? duration;
  String? image;

  Attractions({this.id, this.name, this.subName, this.duration, this.image});

  Attractions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subName = json['sub_name'];
    duration = json['duration'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sub_name'] = this.subName;
    data['duration'] = this.duration;
    data['image'] = this.image;
    return data;
  }
}
