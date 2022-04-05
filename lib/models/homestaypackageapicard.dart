import 'dart:convert';

HomeStayPackageApiCard homeStayPackageApiCardFromJson(String str) => HomeStayPackageApiCard.fromJson(json.decode(str));

String homeStayPackageApiCardToJson(HomeStayPackageApiCard data) => json.encode(data.toJson());


class HomeStayPackageApiCard {
  String? sts;
  String? msg;
  List<Homestays>? homestays;

  HomeStayPackageApiCard({this.sts, this.msg, this.homestays});

  HomeStayPackageApiCard.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['homestays'] != null) {
      homestays = <Homestays>[];
      json['homestays'].forEach((v) {
        homestays!.add(new Homestays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.homestays != null) {
      data['homestays'] = this.homestays!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Homestays {
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
  String? foodDetails;
  String? terms;
  String? food;
  String? roomType;
  int? pincode;
  String? area;
  String? district;
  String? state;
  String? country;
  String? image;
  String? status;
  String? createdAt;

  Homestays(
      {this.id,
      this.agencyId,
      this.name,
      this.contactNo,
      this.mailId,
      this.avgAmount,
      this.offerAmount,
      this.advAmount,
      this.nearstLocation,
      this.desc,
      this.foodDetails,
      this.terms,
      this.food,
      this.roomType,
      this.pincode,
      this.area,
      this.district,
      this.state,
      this.country,
      this.image,
      this.status,
      this.createdAt});

  Homestays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agency_id'];
    name = json['name'];
    contactNo = json['contact_no'];
    mailId = json['mail_id'];
    avgAmount = json['avg_amount'];
    offerAmount = json['offer_amount'];
    advAmount = json['adv_amount'];
    nearstLocation = json['nearst_location'];
    desc = json['desc'];
    foodDetails = json['food_details'];
    terms = json['terms'];
    food = json['food'];
    roomType = json['room_type'];
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
    data['name'] = this.name;
    data['contact_no'] = this.contactNo;
    data['mail_id'] = this.mailId;
    data['avg_amount'] = this.avgAmount;
    data['offer_amount'] = this.offerAmount;
    data['adv_amount'] = this.advAmount;
    data['nearst_location'] = this.nearstLocation;
    data['desc'] = this.desc;
    data['food_details'] = this.foodDetails;
    data['terms'] = this.terms;
    data['food'] = this.food;
    data['room_type'] = this.roomType;
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
