import 'dart:convert';

JobsApiCard jobsApiCardFromJson(String str) => JobsApiCard.fromJson(json.decode(str));

String jobsApiCardToJson(JobsApiCard data) => json.encode(data.toJson());

class JobsApiCard {
  String? sts;
  String? msg;
  List<Jobs>? jobs;

  JobsApiCard({this.sts, this.msg, this.jobs});

  JobsApiCard.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['jobs'] != null) {
      jobs = <Jobs>[];
      json['jobs'].forEach((v) {
        jobs!.add(new Jobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jobs {
  int? id;
  int? agencyId;
  int? catId;
  int? levelId;
  int? typeId;
  String? name;
  String? contactNo;
  String? mailId;
  String? country;
  String? place;
  int? ageLimit;
  String? qualification;
  String? experience;
  int? vaccancyAvalible;
  String? language;
  String? documentsRequired;
  int? fees;
  String? salaryPackage;
  String? videoUrl;
  String? status;
  String? expDate;
  String? createdAt;

  Jobs(
      {this.id,
      this.agencyId,
      this.catId,
      this.levelId,
      this.typeId,
      this.name,
      this.contactNo,
      this.mailId,
      this.country,
      this.place,
      this.ageLimit,
      this.qualification,
      this.experience,
      this.vaccancyAvalible,
      this.language,
      this.documentsRequired,
      this.fees,
      this.salaryPackage,
      this.videoUrl,
      this.status,
      this.expDate,
      this.createdAt});

  Jobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agency_id'];
    catId = json['cat_id'];
    levelId = json['level_id'];
    typeId = json['type_id'];
    name = json['name'];
    contactNo = json['contact_no'];
    mailId = json['mail_id'];
    country = json['country'];
    place = json['place'];
    ageLimit = json['age_limit'];
    qualification = json['qualification'];
    experience = json['experience'];
    vaccancyAvalible = json['vaccancy_avalible'];
    language = json['language'];
    documentsRequired = json['documents_required'];
    fees = json['fees'];
    salaryPackage = json['salary_package'];
    videoUrl = json['video_url'];
    status = json['status'];
    expDate = json['exp_date'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agency_id'] = this.agencyId;
    data['cat_id'] = this.catId;
    data['level_id'] = this.levelId;
    data['type_id'] = this.typeId;
    data['name'] = this.name;
    data['contact_no'] = this.contactNo;
    data['mail_id'] = this.mailId;
    data['country'] = this.country;
    data['place'] = this.place;
    data['age_limit'] = this.ageLimit;
    data['qualification'] = this.qualification;
    data['experience'] = this.experience;
    data['vaccancy_avalible'] = this.vaccancyAvalible;
    data['language'] = this.language;
    data['documents_required'] = this.documentsRequired;
    data['fees'] = this.fees;
    data['salary_package'] = this.salaryPackage;
    data['video_url'] = this.videoUrl;
    data['status'] = this.status;
    data['exp_date'] = this.expDate;
    data['created_at'] = this.createdAt;
    return data;
  }
}
