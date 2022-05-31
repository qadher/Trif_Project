// To parse this JSON data, do
//
//     final searchResponseModel = searchResponseModelFromJson(jsonString);

import 'dart:convert';

SearchResponseModel searchResponseModelFromJson(String str) => SearchResponseModel.fromJson(json.decode(str));

String searchResponseModelToJson(SearchResponseModel data) => json.encode(data.toJson());

class SearchResponseModel {
    SearchResponseModel({
        this.sts,
        this.msg,
        this.search,
    });

    String? sts;
    String? msg;
    List<Search>? search;

    factory SearchResponseModel.fromJson(Map<String, dynamic> json) => SearchResponseModel(
        sts: json["sts"],
        msg: json["msg"],
        search: List<Search>.from(json["search"].map((x) => Search.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "search": List<dynamic>.from(search!.map((x) => x.toJson())),
    };
}

class Search {
    Search({
        this.id,
        this.name,
        this.image,
        this.category,
    });

    int? id;
    String? name;
    String? image;
    String? category;

    factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "category": category,
    };
}
