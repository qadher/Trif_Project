// To parse this JSON data, do
//
//     final houseBoatVideosModel = houseBoatVideosModelFromJson(jsonString);

import 'dart:convert';

HouseBoatVideosModel houseBoatVideosModelFromJson(String str) => HouseBoatVideosModel.fromJson(json.decode(str));

String houseBoatVideosModelToJson(HouseBoatVideosModel data) => json.encode(data.toJson());

class HouseBoatVideosModel {
    HouseBoatVideosModel({
        this.sts,
        this.msg,
        this.videos,
    });

    String? sts;
    String? msg;
    List<Video>? videos;

    factory HouseBoatVideosModel.fromJson(Map<String, dynamic> json) => HouseBoatVideosModel(
        sts: json["sts"],
        msg: json["msg"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "videos": List<dynamic>.from(videos!.map((x) => x.toJson())),
    };
}

class Video {
    Video({
        this.id,
        this.type,
        this.placeId,
        this.url,
    });

    int? id;
    String? type;
    int? placeId;
    String? url;

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        type: json["type"],
        placeId: json["place_id"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_id": placeId,
        "url": url,
    };
}
