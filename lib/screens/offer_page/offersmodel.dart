// To parse this JSON data, do
//
//     final offersModel = offersModelFromJson(jsonString);

import 'dart:convert';

OffersModel offersModelFromJson(String str) => OffersModel.fromJson(json.decode(str));

String offersModelToJson(OffersModel data) => json.encode(data.toJson());

class OffersModel {
    OffersModel({
        this.sts,
        this.msg,
        this.offers,
    });

    String? sts;
    String? msg;
    List<Offer>? offers;

    factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        sts: json["sts"],
        msg: json["msg"],
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "offers": List<dynamic>.from(offers!.map((x) => x.toJson())),
    };
}

class Offer {
    Offer({
        this.id,
        this.agencyId,
        this.type,
        this.packageId,
        this.title,
        this.desc,
        this.image,
        this.url,
    });

    int? id;
    int? agencyId;
    String? type;
    int? packageId;
    String? title;
    String? desc;
    String? image;
    String? url;

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        agencyId: json["agency_id"],
        type: json["type"],
        packageId: json["package_id"],
        title: json["title"],
        desc: json["desc"],
        image: json["image"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agency_id": agencyId,
        "type": type,
        "package_id": packageId,
        "title": title,
        "desc": desc,
        "image": image,
        "url": url,
    };
}
