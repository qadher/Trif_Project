// To parse this JSON data, do
//
//     final attracationSinglePageModel = attracationSinglePageModelFromJson(jsonString);

import 'dart:convert';

AttracationSinglePageModel attracationSinglePageModelFromJson(String str) => AttracationSinglePageModel.fromJson(json.decode(str));

String attracationSinglePageModelToJson(AttracationSinglePageModel data) => json.encode(data.toJson());

class AttracationSinglePageModel {
    AttracationSinglePageModel({
        this.sts,
        this.msg,
        this.attraction,
        this.nearby,
        this.similar,
    });

    String? sts;
    String? msg;
    Attraction? attraction;
    List<Nearby>? nearby;
    List<Nearby>? similar;

    factory AttracationSinglePageModel.fromJson(Map<String, dynamic> json) => AttracationSinglePageModel(
        sts: json["sts"],
        msg: json["msg"],
        attraction: Attraction.fromJson(json["attraction"]),
        nearby: List<Nearby>.from(json["nearby"].map((x) => Nearby.fromJson(x))),
        similar: List<Nearby>.from(json["similar"].map((x) => Nearby.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "attraction": attraction!.toJson(),
        "nearby": List<dynamic>.from(nearby!.map((x) => x.toJson())),
        "similar": List<dynamic>.from(similar!.map((x) => x.toJson())),
    };
}

class Attraction {
    Attraction({
        this.id,
        this.placeId,
        this.name,
        this.subName,
        this.searchTags,
        this.nearby,
        this.similar,
        this.address,
        this.desc,
        this.history,
        this.healthIndexing,
        this.duration,
        this.googlemapLink,
        this.area,
        this.pincode,
        this.district,
        this.state,
        this.image,
        this.backImage,
        this.status,
        this.createdAt,
    });

    int? id;
    int? placeId;
    String? name;
    String? subName;
    String? searchTags;
    String? nearby;
    String? similar;
    String? address;
    String? desc;
    String? history;
    String? healthIndexing;
    String? duration;
    String? googlemapLink;
    String? area;
    String? pincode;
    String? district;
    String? state;
    String? image;
    String? backImage;
    String? status;
    DateTime? createdAt;

    factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
        id: json["id"],
        placeId: json["place_id"],
        name: json["name"],
        subName: json["sub_name"],
        searchTags: json["search_tags"],
        nearby: json["nearby"],
        similar: json["similar"],
        address: json["address"],
        desc: json["desc"],
        history: json["history"],
        healthIndexing: json["health_indexing"],
        duration: json["duration"],
        googlemapLink: json["googlemap_link"],
        area: json["area"],
        pincode: json["pincode"],
        district: json["district"],
        state: json["state"],
        image: json["image"],
        backImage: json["back_image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "place_id": placeId,
        "name": name,
        "sub_name": subName,
        "search_tags": searchTags,
        "nearby": nearby,
        "similar": similar,
        "address": address,
        "desc": desc,
        "history": history,
        "health_indexing": healthIndexing,
        "duration": duration,
        "googlemap_link": googlemapLink,
        "area": area,
        "pincode": pincode,
        "district": district,
        "state": state,
        "image": image,
        "back_image": backImage,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
    };
}

class Nearby {
    Nearby({
        this.name,
        this.id,
        this.image,
    });

    String? name;
    int? id;
    String? image;

    factory Nearby.fromJson(Map<String, dynamic> json) => Nearby(
        name: json["name"],
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "image": image,
    };
}
