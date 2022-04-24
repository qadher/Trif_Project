// To parse this JSON data, do
//
//     final tourSinglePageModel = tourSinglePageModelFromJson(jsonString);

import 'dart:convert';

TourSinglePageModel tourSinglePageModelFromJson(String str) => TourSinglePageModel.fromJson(json.decode(str));

String tourSinglePageModelToJson(TourSinglePageModel data) => json.encode(data.toJson());

class TourSinglePageModel {
    TourSinglePageModel({
        this.sts,
        this.msg,
        this.place,
        this.nearbyPlaces,
        this.similarPlaces,
        this.attractions,
    });

    String? sts;
    String? msg;
    Place? place;
    List<dynamic>? nearbyPlaces;
    List<dynamic>? similarPlaces;
    List<dynamic>? attractions;

    factory TourSinglePageModel.fromJson(Map<String, dynamic> json) => TourSinglePageModel(
        sts: json["sts"],
        msg: json["msg"],
        place: Place.fromJson(json["place"]),
        nearbyPlaces: List<dynamic>.from(json["nearby_places"].map((x) => x)),
        similarPlaces: List<dynamic>.from(json["similar_places"].map((x) => x)),
        attractions: List<dynamic>.from(json["attractions"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "place": place!.toJson(),
        "nearby_places": List<dynamic>.from(nearbyPlaces!.map((x) => x)),
        "similar_places": List<dynamic>.from(similarPlaces!.map((x) => x)),
        "attractions": List<dynamic>.from(attractions!.map((x) => x)),
    };
}

class Place {
    Place({
        this.id,
        this.name,
        this.subName,
        this.placeCode,
        this.searchTags,
        this.nearbyPlaces,
        this.similarPlaces,
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
        this.country,
        this.image,
        this.backImage,
        this.status,
        this.createdAt,
    });

    int? id;
    String? name;
    String? subName;
    String? placeCode;
    String? searchTags;
    String? nearbyPlaces;
    String? similarPlaces;
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
    String? country;
    String? image;
    String? backImage;
    String? status;
    DateTime? createdAt;

    factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        name: json["name"],
        subName: json["sub_name"],
        placeCode: json["place_code"],
        searchTags: json["search_tags"],
        nearbyPlaces: json["nearby_places"],
        similarPlaces: json["similar_places"],
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
        country: json["country"],
        image: json["image"],
        backImage: json["back_image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sub_name": subName,
        "place_code": placeCode,
        "search_tags": searchTags,
        "nearby_places": nearbyPlaces,
        "similar_places": similarPlaces,
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
        "country": country,
        "image": image,
        "back_image": backImage,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
    };
}
