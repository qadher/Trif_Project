// To parse this JSON data, do
//
//     final campingApiCard = campingApiCardFromJson(jsonString);

import 'dart:convert';

CampingApiCard campingApiCardFromJson(String str) => CampingApiCard.fromJson(json.decode(str));

String campingApiCardToJson(CampingApiCard data) => json.encode(data.toJson());

class CampingApiCard {
    CampingApiCard({
        this.sts,
        this.msg,
        this.camping,
    });

    String? sts;
    String? msg;
    List<Camping>? camping;

    factory CampingApiCard.fromJson(Map<String, dynamic> json) => CampingApiCard(
        sts: json["sts"],
        msg: json["msg"],
        camping: List<Camping>.from(json["camping"].map((x) => Camping.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "camping": List<dynamic>.from(camping!.map((x) => x.toJson())),
    };
}

class Camping {
    Camping({
        this.id,
        this.agencyId,
        this.name,
        this.contactNo,
        this.mailId,
        this.avgAmount,
        this.offerAmount,
        this.advAmount,
        this.nearstLocation,
        this.desc,
        this.inclusion,
        this.exclusion,
        this.pincode,
        this.area,
        this.district,
        this.state,
        this.country,
        this.image,
        this.status,
        this.createdAt,
    });

    int? id;
    int? agencyId;
    String? name;
    String? contactNo;
    String? mailId;
    int? avgAmount;
    int? offerAmount;
    int? advAmount;
    String? nearstLocation;
    String? desc;
    String? inclusion;
    String? exclusion;
    int? pincode;
    String? area;
    String? district;
    String? state;
    String? country;
    String? image;
    String? status;
    DateTime? createdAt;

    factory Camping.fromJson(Map<String, dynamic> json) => Camping(
        id: json["id"],
        agencyId: json["agency_id"],
        name: json["name"],
        contactNo: json["contact_no"],
        mailId: json["mail_id"],
        avgAmount: json["avg_amount"],
        offerAmount: json["offer_amount"],
        advAmount: json["adv_amount"],
        nearstLocation: json["nearst_location"],
        desc: json["desc"],
        inclusion: json["inclusion"],
        exclusion: json["exclusion"],
        pincode: json["pincode"],
        area: json["area"],
        district: json["district"],
        state: json["state"],
        country: json["country"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agency_id": agencyId,
        "name": name,
        "contact_no": contactNo,
        "mail_id": mailId,
        "avg_amount": avgAmount,
        "offer_amount": offerAmount,
        "adv_amount": advAmount,
        "nearst_location": nearstLocation,
        "desc": desc,
        "inclusion": inclusion,
        "exclusion": exclusion,
        "pincode": pincode,
        "area": area,
        "district": district,
        "state": state,
        "country": country,
        "image": image,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
    };
}
