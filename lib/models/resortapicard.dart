import 'dart:convert';

ResortApiCard resortApiCardFromJson(String str) => ResortApiCard.fromJson(json.decode(str));

String resortApiCardToJson(ResortApiCard data) => json.encode(data.toJson());

class ResortApiCard {
  String? sts;
  String? msg;
  List<Resorts>? resorts;

  ResortApiCard({this.sts, this.msg, this.resorts});

  ResortApiCard.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['resorts'] != null) {
      resorts = <Resorts>[];
      json['resorts'].forEach((v) {
        resorts!.add(new Resorts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.resorts != null) {
      data['resorts'] = this.resorts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Resorts {
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

  Resorts(
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

  Resorts.fromJson(Map<String, dynamic> json) {
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
