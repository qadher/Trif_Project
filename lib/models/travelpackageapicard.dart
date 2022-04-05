import 'dart:convert';

TravelPackageApiCard travelPackageApiCardFromJson(String str) => TravelPackageApiCard.fromJson(json.decode(str));

String travelPackageApiCardToJson(TravelPackageApiCard data) => json.encode(data.toJson());

class TravelPackageApiCard {
  String? sts;
  String? msg;
  List<Travels>? travels;

  TravelPackageApiCard({this.sts, this.msg, this.travels});

  TravelPackageApiCard.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['travels'] != null) {
      travels = <Travels>[];
      json['travels'].forEach((v) {
        travels!.add(new Travels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.travels != null) {
      data['travels'] = this.travels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Travels {
  int? id;
  int? agencyId;
  int? catId;
  String? name;
  String? type;
  String? contactNo;
  String? mailId;
  String? seating;
  int? perDayAmount;
  int? perDayOfferAmount;
  int? perDayKm;
  int? kmAmount;
  int? perHourAmount;
  int? advAmount;
  int? pincode;
  String? area;
  String? district;
  String? state;
  String? country;
  String? image;
  String? status;
  String? createdAt;

  Travels(
      {this.id,
      this.agencyId,
      this.catId,
      this.name,
      this.type,
      this.contactNo,
      this.mailId,
      this.seating,
      this.perDayAmount,
      this.perDayOfferAmount,
      this.perDayKm,
      this.kmAmount,
      this.perHourAmount,
      this.advAmount,
      this.pincode,
      this.area,
      this.district,
      this.state,
      this.country,
      this.image,
      this.status,
      this.createdAt});

  Travels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agency_id'];
    catId = json['cat_id'];
    name = json['name'];
    type = json['type'];
    contactNo = json['contact_no'];
    mailId = json['mail_id'];
    seating = json['seating'];
    perDayAmount = json['per_day_amount'];
    perDayOfferAmount = json['per_day_offer_amount'];
    perDayKm = json['per_day_km'];
    kmAmount = json['km_amount'];
    perHourAmount = json['per_hour_amount'];
    advAmount = json['adv_amount'];
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
    data['type'] = this.type;
    data['contact_no'] = this.contactNo;
    data['mail_id'] = this.mailId;
    data['seating'] = this.seating;
    data['per_day_amount'] = this.perDayAmount;
    data['per_day_offer_amount'] = this.perDayOfferAmount;
    data['per_day_km'] = this.perDayKm;
    data['km_amount'] = this.kmAmount;
    data['per_hour_amount'] = this.perHourAmount;
    data['adv_amount'] = this.advAmount;
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
