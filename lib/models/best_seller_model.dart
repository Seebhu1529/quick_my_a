// To parse this JSON data, do
//
//     final bestSellersModel = bestSellersModelFromJson(jsonString);

import 'dart:convert';

BestSellersModel bestSellersModelFromJson(String str) =>
    BestSellersModel.fromJson(json.decode(str));

String bestSellersModelToJson(BestSellersModel data) =>
    json.encode(data.toJson());

class BestSellersModel {
  final String status;
  final String requestId;
  final Parameters parameters;
  final Data data;

  BestSellersModel({
    required this.status,
    required this.requestId,
    required this.parameters,
    required this.data,
  });

  factory BestSellersModel.fromJson(Map<String, dynamic> json) =>
      BestSellersModel(
        status: json["status"],
        requestId: json["request_id"],
        parameters: Parameters.fromJson(json["parameters"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request_id": requestId,
        "parameters": parameters.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  final List<BestSeller> bestSellers;
  final String country;
  final String domain;

  Data({
    required this.bestSellers,
    required this.country,
    required this.domain,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bestSellers: List<BestSeller>.from(
            json["best_sellers"].map((x) => BestSeller.fromJson(x))),
        country: json["country"],
        domain: json["domain"],
      );

  Map<String, dynamic> toJson() => {
        "best_sellers": List<dynamic>.from(bestSellers.map((x) => x.toJson())),
        "country": country,
        "domain": domain,
      };
}

class BestSeller {
  final int rank;
  final String asin;
  final String productTitle;
  final String productPrice;
  final String productStarRating;
  final int productNumRatings;
  final String productUrl;
  final String productPhoto;
  final dynamic rankChangeLabel;

  BestSeller({
    required this.rank,
    required this.asin,
    required this.productTitle,
    required this.productPrice,
    required this.productStarRating,
    required this.productNumRatings,
    required this.productUrl,
    required this.productPhoto,
    required this.rankChangeLabel,
  });

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
        rank: json["rank"],
        asin: json["asin"],
        productTitle: json["product_title"],
        productPrice: json["product_price"],
        productStarRating: json["product_star_rating"],
        productNumRatings: json["product_num_ratings"],
        productUrl: json["product_url"],
        productPhoto: json["product_photo"],
        rankChangeLabel: json["rank_change_label"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "asin": asin,
        "product_title": productTitle,
        "product_price": productPrice,
        "product_star_rating": productStarRating,
        "product_num_ratings": productNumRatings,
        "product_url": productUrl,
        "product_photo": productPhoto,
        "rank_change_label": rankChangeLabel,
      };
}

class Parameters {
  final String country;
  final String type;
  final int page;
  final String category;

  Parameters({
    required this.country,
    required this.type,
    required this.page,
    required this.category,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        country: json["country"],
        type: json["type"],
        page: json["page"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "type": type,
        "page": page,
        "category": category,
      };
}
