import 'dart:convert';

PackageApiCard packageApiCardFromJson(String str) => PackageApiCard.fromJson(json.decode(str));

String packageApiCardToJson(PackageApiCard data) => json.encode(data.toJson());


class PackageApiCard {
  String? sts;
  String? msg;
  List<Packages>? packages;

  PackageApiCard({this.sts, this.msg, this.packages});

  PackageApiCard.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  int? id;
  int? agencyId;
  int? catId;
  String? name;
  String? searchTags;
  String? contactNo;
  String? mailId;
  String? days;
  String? desc;
  String? inclusion;
  String? exclusion;
  int? avgAmount;
  int? offerAmount;
  int? advAmount;
  String? vechicleDetails;
  String? cancelationPolicy;
  String? image;
  String? status;
  String? createdAt;

  Packages(
      {this.id,
      this.agencyId,
      this.catId,
      this.name,
      this.searchTags,
      this.contactNo,
      this.mailId,
      this.days,
      this.desc,
      this.inclusion,
      this.exclusion,
      this.avgAmount,
      this.offerAmount,
      this.advAmount,
      this.vechicleDetails,
      this.cancelationPolicy,
      this.image,
      this.status,
      this.createdAt});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agency_id'];
    catId = json['cat_id'];
    name = json['name'];
    searchTags = json['search_tags'];
    contactNo = json['contact_no'];
    mailId = json['mail_id'];
    days = json['days'];
    desc = json['desc'];
    inclusion = json['inclusion'];
    exclusion = json['exclusion'];
    avgAmount = json['avg_amount'];
    offerAmount = json['offer_amount'];
    advAmount = json['adv_amount'];
    vechicleDetails = json['vechicle_details'];
    cancelationPolicy = json['cancelation_policy'];
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
    data['search_tags'] = this.searchTags;
    data['contact_no'] = this.contactNo;
    data['mail_id'] = this.mailId;
    data['days'] = this.days;
    data['desc'] = this.desc;
    data['inclusion'] = this.inclusion;
    data['exclusion'] = this.exclusion;
    data['avg_amount'] = this.avgAmount;
    data['offer_amount'] = this.offerAmount;
    data['adv_amount'] = this.advAmount;
    data['vechicle_details'] = this.vechicleDetails;
    data['cancelation_policy'] = this.cancelationPolicy;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
