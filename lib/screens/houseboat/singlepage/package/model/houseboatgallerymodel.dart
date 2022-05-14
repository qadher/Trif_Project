// To parse this JSON data, do
//
//     final houseBoatGalleryModel = houseBoatGalleryModelFromJson(jsonString);

import 'dart:convert';

HouseBoatGalleryModel houseBoatGalleryModelFromJson(String str) => HouseBoatGalleryModel.fromJson(json.decode(str));

String houseBoatGalleryModelToJson(HouseBoatGalleryModel data) => json.encode(data.toJson());

class HouseBoatGalleryModel {
    HouseBoatGalleryModel({
        this.sts,
        this.msg,
        this.images,
    });

    String? sts;
    String? msg;
    List<Image>? images;

    factory HouseBoatGalleryModel.fromJson(Map<String, dynamic> json) => HouseBoatGalleryModel(
        sts: json["sts"],
        msg: json["msg"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    };
}

class Image {
    Image({
        this.id,
        this.type,
        this.placeId,
        this.image,
    });

    int? id;
    String? type;
    int? placeId;
    String? image;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        type: json["type"],
        placeId: json["place_id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_id": placeId,
        "image": image,
    };
}
