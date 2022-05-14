// To parse this JSON data, do
//
//     final campingSinglepageModel = campingSinglepageModelFromJson(jsonString);

import 'dart:convert';

CampingSinglepageModel campingSinglepageModelFromJson(String str) => CampingSinglepageModel.fromJson(json.decode(str));

String campingSinglepageModelToJson(CampingSinglepageModel data) => json.encode(data.toJson());

class CampingSinglepageModel {
    CampingSinglepageModel({
        this.sts,
        this.msg,
        this.camp,
        this.agency,
    });

    String? sts;
    String? msg;
    Camp? camp;
    Agency? agency;

    factory CampingSinglepageModel.fromJson(Map<String, dynamic> json) => CampingSinglepageModel(
        sts: json["sts"],
        msg: json["msg"],
        camp: Camp.fromJson(json["camp"]),
        agency: Agency.fromJson(json["agency"]),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "camp": camp!.toJson(),
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

class Camp {
    Camp({
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

    factory Camp.fromJson(Map<String, dynamic> json) => Camp(
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
