// To parse this JSON data, do
//
//     final resortSinglePageModel = resortSinglePageModelFromJson(jsonString);

import 'dart:convert';

ResortSinglePageModel resortSinglePageModelFromJson(String str) => ResortSinglePageModel.fromJson(json.decode(str));

String resortSinglePageModelToJson(ResortSinglePageModel data) => json.encode(data.toJson());

class ResortSinglePageModel {
    ResortSinglePageModel({
        this.sts,
        this.msg,
        this.resort,
        this.agency,
    });

    String? sts;
    String? msg;
    Resort? resort;
    Agency? agency;

    factory ResortSinglePageModel.fromJson(Map<String, dynamic> json) => ResortSinglePageModel(
        sts: json["sts"],
        msg: json["msg"],
        resort: Resort.fromJson(json["resort"]),
        agency: Agency.fromJson(json["agency"]),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "resort": resort!.toJson(),
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
    DateTime? lisenceExpiry;
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
        lisenceExpiry: DateTime.parse(json["lisence_expiry"]),
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
        "lisence_expiry": "${lisenceExpiry!.year.toString().padLeft(4, '0')}-${lisenceExpiry!.month.toString().padLeft(2, '0')}-${lisenceExpiry!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt!.toIso8601String(),
    };
}

class Resort {
    Resort({
        this.id,
        this.agencyId,
        this.catId,
        this.name,
        this.contactNo,
        this.mailId,
        this.roomManagement,
        this.avgAmount,
        this.offerAmount,
        this.advAmount,
        this.food,
        this.foodDesc,
        this.nearstLocation,
        this.address,
        this.additionalActivities,
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
    int? catId;
    String? name;
    String? contactNo;
    String? mailId;
    String? roomManagement;
    int? avgAmount;
    int? offerAmount;
    int? advAmount;
    String? food;
    String? foodDesc;
    String? nearstLocation;
    String? address;
    String? additionalActivities;
    int? pincode;
    String? area;
    String? district;
    String? state;
    String? country;
    String? image;
    String? status;
    DateTime? createdAt;

    factory Resort.fromJson(Map<String, dynamic> json) => Resort(
        id: json["id"],
        agencyId: json["agency_id"],
        catId: json["cat_id"],
        name: json["name"],
        contactNo: json["contact_no"],
        mailId: json["mail_id"],
        roomManagement: json["room_management"],
        avgAmount: json["avg_amount"],
        offerAmount: json["offer_amount"],
        advAmount: json["adv_amount"],
        food: json["food"],
        foodDesc: json["food_desc"],
        nearstLocation: json["nearst_location"],
        address: json["address"],
        additionalActivities: json["additional_activities"],
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
        "cat_id": catId,
        "name": name,
        "contact_no": contactNo,
        "mail_id": mailId,
        "room_management": roomManagement,
        "avg_amount": avgAmount,
        "offer_amount": offerAmount,
        "adv_amount": advAmount,
        "food": food,
        "food_desc": foodDesc,
        "nearst_location": nearstLocation,
        "address": address,
        "additional_activities": additionalActivities,
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
