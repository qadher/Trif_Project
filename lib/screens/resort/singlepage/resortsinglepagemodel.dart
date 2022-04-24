import 'dart:convert';

ResortSinglePageModel resortSinglePageModelFromJson(String str) => ResortSinglePageModel.fromJson(json.decode(str));

String resortSinglePageModelToJson(ResortSinglePageModel data) => json.encode(data.toJson());

class ResortSinglePageModel {
  String? sts;
  String? msg;
  Resort? resort;
  Agency? agency;

  ResortSinglePageModel({this.sts, this.msg, this.resort, this.agency});

  ResortSinglePageModel.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    resort =
        json['resort'] != null ? new Resort.fromJson(json['resort']) : null;
    agency =
        json['agency'] != null ? new Agency.fromJson(json['agency']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.resort != null) {
      data['resort'] = this.resort!.toJson();
    }
    if (this.agency != null) {
      data['agency'] = this.agency!.toJson();
    }
    return data;
  }
}

class Resort {
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
  String? createdAt;

  Resort(
      {this.id,
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
      this.createdAt});

  Resort.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agency_id'];
    catId = json['cat_id'];
    name = json['name'];
    contactNo = json['contact_no'];
    mailId = json['mail_id'];
    roomManagement = json['room_management'];
    avgAmount = json['avg_amount'];
    offerAmount = json['offer_amount'];
    advAmount = json['adv_amount'];
    food = json['food'];
    foodDesc = json['food_desc'];
    nearstLocation = json['nearst_location'];
    address = json['address'];
    additionalActivities = json['additional_activities'];
    pincode = json['pincode'];
    area = json['area'];
    district = json['district'];
    state = json['state'];
    country = json['country'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agency_id'] = this.agencyId;
    data['cat_id'] = this.catId;
    data['name'] = this.name;
    data['contact_no'] = this.contactNo;
    data['mail_id'] = this.mailId;
    data['room_management'] = this.roomManagement;
    data['avg_amount'] = this.avgAmount;
    data['offer_amount'] = this.offerAmount;
    data['adv_amount'] = this.advAmount;
    data['food'] = this.food;
    data['food_desc'] = this.foodDesc;
    data['nearst_location'] = this.nearstLocation;
    data['address'] = this.address;
    data['additional_activities'] = this.additionalActivities;
    data['pincode'] = this.pincode;
    data['area'] = this.area;
    data['district'] = this.district;
    data['state'] = this.state;
    data['country'] = this.country;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Agency {
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
  Null? lisenceExpiry;
  String? createdAt;

  Agency(
      {this.id,
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
      this.createdAt});

  Agency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentId = json['agent_id'];
    plan = json['plan'];
    walletBalence = json['wallet_balence'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    phone = json['phone'];
    address = json['address'];
    pincode = json['pincode'];
    area = json['area'];
    district = json['district'];
    state = json['state'];
    password = json['password'];
    houseBoat = json['house_boat'];
    resort = json['resort'];
    onlyTravelling = json['only_travelling'];
    camping = json['camping'];
    trucking = json['trucking'];
    homeStay = json['home_stay'];
    tourPackages = json['tour_packages'];
    abroadStudy = json['abroad_study'];
    abroadJobs = json['abroad_jobs'];
    status = json['status'];
    logo = json['logo'];
    regPaper = json['reg_paper'];
    idProof = json['id_proof'];
    idProof2 = json['id_proof2'];
    lisenceExpiry = json['lisence_expiry'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agent_id'] = this.agentId;
    data['plan'] = this.plan;
    data['wallet_balence'] = this.walletBalence;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['area'] = this.area;
    data['district'] = this.district;
    data['state'] = this.state;
    data['password'] = this.password;
    data['house_boat'] = this.houseBoat;
    data['resort'] = this.resort;
    data['only_travelling'] = this.onlyTravelling;
    data['camping'] = this.camping;
    data['trucking'] = this.trucking;
    data['home_stay'] = this.homeStay;
    data['tour_packages'] = this.tourPackages;
    data['abroad_study'] = this.abroadStudy;
    data['abroad_jobs'] = this.abroadJobs;
    data['status'] = this.status;
    data['logo'] = this.logo;
    data['reg_paper'] = this.regPaper;
    data['id_proof'] = this.idProof;
    data['id_proof2'] = this.idProof2;
    data['lisence_expiry'] = this.lisenceExpiry;
    data['created_at'] = this.createdAt;
    return data;
  }
}
