// To parse this JSON data, do
//
//     final tourCategoriesModel = tourCategoriesModelFromJson(jsonString);

import 'dart:convert';

TourCategoriesModel tourCategoriesModelFromJson(String str) => TourCategoriesModel.fromJson(json.decode(str));

String tourCategoriesModelToJson(TourCategoriesModel data) => json.encode(data.toJson());

class TourCategoriesModel {
    TourCategoriesModel({
        this.sts,
        this.msg,
        this.categories,
    });

    String? sts;
    String? msg;
    List<Category>? categories;

    factory TourCategoriesModel.fromJson(Map<String, dynamic> json) => TourCategoriesModel(
        sts: json["sts"],
        msg: json["msg"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sts": sts,
        "msg": msg,
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.id,
        this.name,
        this.image,
        this.dispOrder,
    });

    int? id;
    String? name;
    String? image;
    int? dispOrder;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        dispOrder: json["disp_order"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "disp_order": dispOrder,
    };
}
