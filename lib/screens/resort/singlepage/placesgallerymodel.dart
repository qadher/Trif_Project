import 'dart:convert';

PlacesGalleryModel placesGalleryModelFromJson(String str) => PlacesGalleryModel.fromJson(json.decode(str));

String placesGalleryModelToJson(PlacesGalleryModel data) => json.encode(data.toJson());

class PlacesGalleryModel {
  String? sts;
  String? msg;
  List<Images>? images;

  PlacesGalleryModel({this.sts, this.msg, this.images});

  PlacesGalleryModel.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  String? type;
  int? placeId;
  String? image;

  Images({this.id, this.type, this.placeId, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    placeId = json['place_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['place_id'] = this.placeId;
    data['image'] = this.image;
    return data;
  }
}
