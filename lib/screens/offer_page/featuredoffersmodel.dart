// To parse this JSON data, do
//
//     final featuredOffersModel = featuredOffersModelFromJson(jsonString);

import 'dart:convert';

FeaturedOffersModel featuredOffersModelFromJson(String str) => FeaturedOffersModel.fromJson(json.decode(str));

String featuredOffersModelToJson(FeaturedOffersModel data) => json.encode(data.toJson());

class FeaturedOffersModel {
    FeaturedOffersModel({
        this.sts,
        this.msg,
        this.featured,
    });

    String? sts;
    String? msg;
    List<Featured>? featured;

    factory FeaturedOffersModel.fromJson(Map<String, dynamic> json) => FeaturedOffersModel(
        sts: json["sts"],
        msg: json["msg"],
        featured: List<Featured>.from(json["featured"].map((x) => Featured.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "featured": List<dynamic>.from(featured!.map((x) => x.toJson())),
    };
}

class Featured {
    Featured({
        this.id,
        this.agencyId,
        this.offerId,
        this.pincode,
        this.district,
        this.state,
        this.startDate,
        this.endDate,
        this.days,
        this.amount,
        this.createdAt,
    });

    int? id;
    int? agencyId;
    int? offerId;
    String? pincode;
    String? district;
    String? state;
    DateTime? startDate;
    DateTime? endDate;
    int? days;
    int? amount;
    DateTime? createdAt;

    factory Featured.fromJson(Map<String, dynamic> json) => Featured(
        id: json["id"],
        agencyId: json["agency_id"],
        offerId: json["offer_id"],
        pincode: json["pincode"],
        district: json["district"],
        state: json["state"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        days: json["days"],
        amount: json["amount"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agency_id": agencyId,
        "offer_id": offerId,
        "pincode": pincode,
        "district": district,
        "state": state,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "days": days,
        "amount": amount,
        "created_at": createdAt!.toIso8601String(),
    };
}
