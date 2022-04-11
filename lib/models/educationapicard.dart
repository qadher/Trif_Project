import 'dart:convert';

EducationApiCard educationApiCardFromJson(String str) => EducationApiCard.fromJson(json.decode(str));

String educationApiCardToJson(EducationApiCard data) => json.encode(data.toJson());

class EducationApiCard {
  String? sts;
  String? msg;
  List<Universities>? universities;

  EducationApiCard({this.sts, this.msg, this.universities});

  EducationApiCard.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['universities'] != null) {
      universities = <Universities>[];
      json['universities'].forEach((v) {
        universities!.add(new Universities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.universities != null) {
      data['universities'] = this.universities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Universities {
  int? id;
  int? agencyId;
  int? continentId;
  int? countryId;
  String? name;
  String? contactNo;
  String? mailId;
  String? address;
  int? fees;
  String? universityFees;
  String? intakeTimeline;
  String? desc;
  String? duration;
  String? accomedation;
  String? visaProcessing;
  String? jobAssistance;
  String? streamDesc;
  String? ilts;
  String? image;
  String? status;
  String? createdAt;

  Universities(
      {this.id,
      this.agencyId,
      this.continentId,
      this.countryId,
      this.name,
      this.contactNo,
      this.mailId,
      this.address,
      this.fees,
      this.universityFees,
      this.intakeTimeline,
      this.desc,
      this.duration,
      this.accomedation,
      this.visaProcessing,
      this.jobAssistance,
      this.streamDesc,
      this.ilts,
      this.image,
      this.status,
      this.createdAt});

  Universities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agencyId = json['agency_id'];
    continentId = json['continent_id'];
    countryId = json['country_id'];
    name = json['name'];
    contactNo = json['contact_no'];
    mailId = json['mail_id'];
    address = json['address'];
    fees = json['fees'];
    universityFees = json['university_fees'];
    intakeTimeline = json['intake_timeline'];
    desc = json['desc'];
    duration = json['duration'];
    accomedation = json['accomedation'];
    visaProcessing = json['visa_processing'];
    jobAssistance = json['job_assistance'];
    streamDesc = json['stream_desc'];
    ilts = json['ilts'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agency_id'] = this.agencyId;
    data['continent_id'] = this.continentId;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['contact_no'] = this.contactNo;
    data['mail_id'] = this.mailId;
    data['address'] = this.address;
    data['fees'] = this.fees;
    data['university_fees'] = this.universityFees;
    data['intake_timeline'] = this.intakeTimeline;
    data['desc'] = this.desc;
    data['duration'] = this.duration;
    data['accomedation'] = this.accomedation;
    data['visa_processing'] = this.visaProcessing;
    data['job_assistance'] = this.jobAssistance;
    data['stream_desc'] = this.streamDesc;
    data['ilts'] = this.ilts;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
