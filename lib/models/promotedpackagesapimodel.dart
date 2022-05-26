// To parse this JSON data, do
//
//     final promotedPackagesApiModel = promotedPackagesApiModelFromJson(jsonString);

import 'dart:convert';

PromotedPackagesApiModel promotedPackagesApiModelFromJson(String str) => PromotedPackagesApiModel.fromJson(json.decode(str));

String promotedPackagesApiModelToJson(PromotedPackagesApiModel data) => json.encode(data.toJson());

class PromotedPackagesApiModel {
    PromotedPackagesApiModel({
        this.sts,
        this.msg,
        this.promoted,
    });

    String? sts;
    String? msg;
    List<Promoted>? promoted;

    factory PromotedPackagesApiModel.fromJson(Map<String, dynamic> json) => PromotedPackagesApiModel(
        sts: json["sts"],
        msg: json["msg"],
        promoted: List<Promoted>.from(json["promoted"].map((x) => Promoted.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "promoted": List<dynamic>.from(promoted!.map((x) => x.toJson())),
    };
}

class Promoted {
    Promoted({
        this.id,
        this.agencyId,
        this.type,
        this.packageId,
        this.pincode,
        this.district,
        this.state,
        this.startDate,
        this.endDate,
        this.days,
        this.amount,
        this.image,
        this.createdAt,
    });

    int? id;
    int? agencyId;
    String? type;
    int? packageId;
    String? pincode;
    String? district;
    String? state;
    DateTime? startDate;
    DateTime? endDate;
    int? days;
    int? amount;
    String? image;
    DateTime? createdAt;

    factory Promoted.fromJson(Map<String, dynamic> json) => Promoted(
        id: json["id"],
        agencyId: json["agency_id"],
        type: json["type"],
        packageId: json["package_id"],
        pincode: json["pincode"],
        district: json["district"],
        state: json["state"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        days: json["days"],
        amount: json["amount"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agency_id": agencyId,
        "type": type,
        "package_id": packageId,
        "pincode": pincode,
        "district": district,
        "state": state,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "days": days,
        "amount": amount,
        "image": image,
        "created_at": createdAt!.toIso8601String(),
    };
}
