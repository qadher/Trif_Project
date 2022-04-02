import 'dart:convert';

HouseBoatApiCard houseBoatApiCardFromJson(String str) => HouseBoatApiCard.fromJson(json.decode(str));

String houseBoatApiCardToJson(HouseBoatApiCard data) => json.encode(data.toJson());

class HouseBoatApiCard {
  String? sts;
  String? msg;
  List<Houseboats>? houseboats;

  HouseBoatApiCard({this.sts, this.msg, this.houseboats});

  HouseBoatApiCard.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['houseboats'] != null) {
      houseboats = <Houseboats>[];
      json['houseboats'].forEach((v) {
        houseboats!.add(new Houseboats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.houseboats != null) {
      data['houseboats'] = this.houseboats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Houseboats {
  int? id;
  int? agencyId;
  String? name;
  String? contactNo;
  String? mailId;
  String? startPoint;
  String? endPoint;
  int? days;
  int? budget;
  int? offerAmount;
  int? advAmount;
  String? food;
  int? room;
  String? roomType;
  String? description;
  String? itinerary;
  String? district;
  String? state;
  String? country;
  String? status;
  String? image;
  String? createdAt;

  Houseboats(
      {this.id,
      this.agencyId,
      this.name,
      this.contactNo,
      this.mailId,
      this.startPoint,
      this.endPoint,
      this.days,
      this.budget,
      this.offerAmount,
      this.advAmount,
      this.food,
      this.room,
      this.roomType,
      this.description,
      this.itinerary,
      this.district,
      this.state,
      this.country,
      this.status,
      this.image,
      this.createdAt});

  Houseboats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agency_id'];
    name = json['name'];
    contactNo = json['contact_no'];
    mailId = json['mail_id'];
    startPoint = json['start_point'];
    endPoint = json['end_point'];
    days = json['days'];
    budget = json['budget'];
    offerAmount = json['offer_amount'];
    advAmount = json['adv_amount'];
    food = json['food'];
    room = json['room'];
    roomType = json['room_type'];
    description = json['description'];
    itinerary = json['itinerary'];
    district = json['district'];
    state = json['state'];
    country = json['country'];
    status = json['status'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agency_id'] = this.agencyId;
    data['name'] = this.name;
    data['contact_no'] = this.contactNo;
    data['mail_id'] = this.mailId;
    data['start_point'] = this.startPoint;
    data['end_point'] = this.endPoint;
    data['days'] = this.days;
    data['budget'] = this.budget;
    data['offer_amount'] = this.offerAmount;
    data['adv_amount'] = this.advAmount;
    data['food'] = this.food;
    data['room'] = this.room;
    data['room_type'] = this.roomType;
    data['description'] = this.description;
    data['itinerary'] = this.itinerary;
    data['district'] = this.district;
    data['state'] = this.state;
    data['country'] = this.country;
    data['status'] = this.status;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}
