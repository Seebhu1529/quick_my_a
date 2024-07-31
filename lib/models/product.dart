import 'dart:convert' show jsonDecode;

import 'package:flutter/services.dart';

Future<List<ProductModel>> getProducts() async {
  final jsonString = await rootBundle.loadString("assets/item.json");
  Map<String, dynamic> responseData = await jsonDecode(jsonString);
  List<ProductModel> product = (responseData["products"] as List)
      .map((e) => ProductModel.fromJson(e))
      .toList();
  return product;
}

class ProductModel {
  final String name;
  final int price;
  final String description;
  final List<String>? image;
  final Color color;
  final Size size;

  ProductModel({
    required this.name,
    required this.price,
    required this.description,
    this.image,
    required this.color,
    required this.size,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        color: Color.fromJson(json["color"]),
        size: Size.fromJson(json["size"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "color": color.toJson(),
        "size": size.toJson(),
      };
}

class Color {
  final int count;
  final List<Datum> data;

  Color({
    required this.count,
    required this.data,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String color;
  final String code;
  final int price;

  Datum({
    required this.color,
    required this.code,
    required this.price,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        color: json["color"],
        code: json["code"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "code": code,
        "price": price,
      };
}

class Size {
  final int count;
  final List<String> data;

  Size({
    required this.count,
    required this.data,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        count: json["count"],
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
