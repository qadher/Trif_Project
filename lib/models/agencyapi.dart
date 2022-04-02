import 'dart:convert';

AgenyApi agenyApiFromJson(String str) => AgenyApi.fromJson(json.decode(str));

String agenyApiToJson(AgenyApi data) => json.encode(data.toJson());

class AgenyApi {
  String? sts;
  String? msg;
  List<Agency>? agency;

  AgenyApi({this.sts, this.msg, this.agency});

  AgenyApi.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['agency'] != null) {
      agency = <Agency>[];
      json['agency'].forEach((v) {
        agency!.add(new Agency.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.agency != null) {
      data['agency'] = this.agency!.map((v) => v.toJson()).toList();
    }
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
  String? lisenceExpiry;
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
