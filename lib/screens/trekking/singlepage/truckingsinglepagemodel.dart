// To parse this JSON data, do
//
//     final truckingSinglePageModel = truckingSinglePageModelFromJson(jsonString);

import 'dart:convert';

TruckingSinglePageModel truckingSinglePageModelFromJson(String str) => TruckingSinglePageModel.fromJson(json.decode(str));

String truckingSinglePageModelToJson(TruckingSinglePageModel data) => json.encode(data.toJson());

class TruckingSinglePageModel {
    TruckingSinglePageModel({
        this.sts,
        this.msg,
        this.trucking,
        this.agency,
    });

    String? sts;
    String? msg;
    Trucking? trucking;
    Agency? agency;

    factory TruckingSinglePageModel.fromJson(Map<String, dynamic> json) => TruckingSinglePageModel(
        sts: json["sts"],
        msg: json["msg"],
        trucking: Trucking.fromJson(json["trucking"]),
        agency: Agency.fromJson(json["agency"]),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "trucking": trucking!.toJson(),
        "agency": agency!.toJson(),
    };
}

class Agency {
    Agency({
        this.id,
        this.agentId,
        this.plan,
        this.walletBalence,
        this.name,
        this.email,
        this.mobile,
        this.phone,
        this.address,
        this.pincode,
        this.area,
        this.district,
        this.state,
        this.password,
        this.houseBoat,
        this.resort,
        this.onlyTravelling,
        this.camping,
        this.trucking,
        this.homeStay,
        this.tourPackages,
        this.abroadStudy,
        this.abroadJobs,
        this.status,
        this.logo,
        this.regPaper,
        this.idProof,
        this.idProof2,
        this.lisenceExpiry,
        this.createdAt,
    });

    int? id;
    int? agentId;
    String? plan;
    int? walletBalence;
    String? name;
    String? email;
    String? mobile;
    String? phone;
    String? address;
    String? pincode;
    String? area;
    String? district;
    String? state;
    String? password;
    String? houseBoat;
    String? resort;
    String? onlyTravelling;
    String? camping;
    String? trucking;
    String? homeStay;
    String? tourPackages;
    String? abroadStudy;
    String? abroadJobs;
    String? status;
    String? logo;
    String? regPaper;
    String? idProof;
    String? idProof2;
    dynamic? lisenceExpiry;
    DateTime? createdAt;

    factory Agency.fromJson(Map<String, dynamic> json) => Agency(
        id: json["id"],
        agentId: json["agent_id"],
        plan: json["plan"],
        walletBalence: json["wallet_balence"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        phone: json["phone"],
        address: json["address"],
        pincode: json["pincode"],
        area: json["area"],
        district: json["district"],
        state: json["state"],
        password: json["password"],
        houseBoat: json["house_boat"],
        resort: json["resort"],
        onlyTravelling: json["only_travelling"],
        camping: json["camping"],
        trucking: json["trucking"],
        homeStay: json["home_stay"],
        tourPackages: json["tour_packages"],
        abroadStudy: json["abroad_study"],
        abroadJobs: json["abroad_jobs"],
        status: json["status"],
        logo: json["logo"],
        regPaper: json["reg_paper"],
        idProof: json["id_proof"],
        idProof2: json["id_proof2"],
        lisenceExpiry: json["lisence_expiry"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agent_id": agentId,
        "plan": plan,
        "wallet_balence": walletBalence,
        "name": name,
        "email": email,
        "mobile": mobile,
        "phone": phone,
        "address": address,
        "pincode": pincode,
        "area": area,
        "district": district,
        "state": state,
        "password": password,
        "house_boat": houseBoat,
        "resort": resort,
        "only_travelling": onlyTravelling,
        "camping": camping,
        "trucking": trucking,
        "home_stay": homeStay,
        "tour_packages": tourPackages,
        "abroad_study": abroadStudy,
        "abroad_jobs": abroadJobs,
        "status": status,
        "logo": logo,
        "reg_paper": regPaper,
        "id_proof": idProof,
        "id_proof2": idProof2,
        "lisence_expiry": lisenceExpiry,
        "created_at": createdAt!.toIso8601String(),
    };
}

class Trucking {
    Trucking({
        this.id,
        this.agencyId,
        this.name,
        this.contactNo,
        this.mailId,
        this.startPoint,
        this.endPoint,
        this.avgAmount,
        this.offerAmount,
        this.advAmount,
        this.desc,
        this.inclusion,
        this.exclusion,
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
    String? startPoint;
    String? endPoint;
    int? avgAmount;
    int? offerAmount;
    int? advAmount;
    String? desc;
    String? inclusion;
    String? exclusion;
    String? district;
    String? state;
    String? country;
    String? image;
    String? status;
    DateTime? createdAt;

    factory Trucking.fromJson(Map<String, dynamic> json) => Trucking(
        id: json["id"],
        agencyId: json["agency_id"],
        name: json["name"],
        contactNo: json["contact_no"],
        mailId: json["mail_id"],
        startPoint: json["start_point"],
        endPoint: json["end_point"],
        avgAmount: json["avg_amount"],
        offerAmount: json["offer_amount"],
        advAmount: json["adv_amount"],
        desc: json["desc"],
        inclusion: json["inclusion"],
        exclusion: json["exclusion"],
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
        "start_point": startPoint,
        "end_point": endPoint,
        "avg_amount": avgAmount,
        "offer_amount": offerAmount,
        "adv_amount": advAmount,
        "desc": desc,
        "inclusion": inclusion,
        "exclusion": exclusion,
        "district": district,
        "state": state,
        "country": country,
        "image": image,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
    };
}
