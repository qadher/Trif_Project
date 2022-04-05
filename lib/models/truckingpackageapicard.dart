import 'dart:convert';

TruckingPackageApiCard truckingPackageApiCardFromJson(String str) => TruckingPackageApiCard.fromJson(json.decode(str));

String truckingPackageApiCardToJson(TruckingPackageApiCard data) => json.encode(data.toJson());

class TruckingPackageApiCard {
  String? sts;
  String? msg;
  List<Trucking>? trucking;

  TruckingPackageApiCard({this.sts, this.msg, this.trucking});

  TruckingPackageApiCard.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['trucking'] != null) {
      trucking = <Trucking>[];
      json['trucking'].forEach((v) {
        trucking!.add(new Trucking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.trucking != null) {
      data['trucking'] = this.trucking!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trucking {
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
  String? createdAt;

  Trucking(
      {this.id,
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
      this.createdAt});

  Trucking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agency_id'];
    name = json['name'];
    contactNo = json['contact_no'];
    mailId = json['mail_id'];
    startPoint = json['start_point'];
    endPoint = json['end_point'];
    avgAmount = json['avg_amount'];
    offerAmount = json['offer_amount'];
    advAmount = json['adv_amount'];
    desc = json['desc'];
    inclusion = json['inclusion'];
    exclusion = json['exclusion'];
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
    data['start_point'] = this.startPoint;
    data['end_point'] = this.endPoint;
    data['avg_amount'] = this.avgAmount;
    data['offer_amount'] = this.offerAmount;
    data['adv_amount'] = this.advAmount;
    data['desc'] = this.desc;
    data['inclusion'] = this.inclusion;
    data['exclusion'] = this.exclusion;
    data['district'] = this.district;
    data['state'] = this.state;
    data['country'] = this.country;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
