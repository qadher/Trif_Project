import 'dart:convert';

SuperDeluxRoomModel superDeluxModelFromJson(String str) => SuperDeluxRoomModel.fromJson(json.decode(str));

String superDeluxModelToJson(SuperDeluxRoomModel data) => json.encode(data.toJson());

class SuperDeluxRoomModel {
  String? sts;
  String? msg;
  List<Rooms>? rooms;

  SuperDeluxRoomModel({this.sts, this.msg, this.rooms});

  SuperDeluxRoomModel.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  int? id;
  int? resortId;
  String? name;
  int? price;
  int? offerPrice;
  int? rooms;
  int? dispOrder;

  Rooms(
      {this.id,
      this.resortId,
      this.name,
      this.price,
      this.offerPrice,
      this.rooms,
      this.dispOrder});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resortId = json['resort_id'];
    name = json['name'];
    price = json['price'];
    offerPrice = json['offer_price'];
    rooms = json['rooms'];
    dispOrder = json['disp_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['resort_id'] = this.resortId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['offer_price'] = this.offerPrice;
    data['rooms'] = this.rooms;
    data['disp_order'] = this.dispOrder;
    return data;
  }
}
