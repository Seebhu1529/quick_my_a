// To parse this JSON data, do
//
//     final productSearchModel = productSearchModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

ProductSearchModel productSearchModelFromJson(String str) =>
    ProductSearchModel.fromJson(json.decode(str));

String productSearchModelToJson(ProductSearchModel data) =>
    json.encode(data.toJson());

class ProductSearchModel {
  final String status;
  final String requestId;
  final Parameters parameters;
  final Data data;

  ProductSearchModel({
    required this.status,
    required this.requestId,
    required this.parameters,
    required this.data,
  });

  factory ProductSearchModel.fromJson(Map<String, dynamic> json) =>
      ProductSearchModel(
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
  final int totalProducts;
  final String country;
  final String domain;
  final List<Product> products;

  Data({
    required this.totalProducts,
    required this.country,
    required this.domain,
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalProducts: json["total_products"],
        country: json["country"],
        domain: json["domain"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_products": totalProducts,
        "country": country,
        "domain": domain,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final String asin;
  final String productTitle;
  final String productPrice;
  final String productOriginalPrice;
  final Currency currency;
  final String? productStarRating;
  final int productNumRatings;
  final String productUrl;
  final String productPhoto;
  final int productNumOffers;
  final String productMinimumOfferPrice;
  final bool isBestSeller;
  final bool isAmazonChoice;
  final bool isPrime;
  final bool climatePledgeFriendly;
  final String salesVolume;
  final String delivery;
  final String? couponText;
  final bool hasVariations;
  final String? productAvailability;

  Product({
    required this.asin,
    required this.productTitle,
    required this.productPrice,
    required this.productOriginalPrice,
    required this.currency,
    required this.productStarRating,
    required this.productNumRatings,
    required this.productUrl,
    required this.productPhoto,
    required this.productNumOffers,
    required this.productMinimumOfferPrice,
    required this.isBestSeller,
    required this.isAmazonChoice,
    required this.isPrime,
    required this.climatePledgeFriendly,
    required this.salesVolume,
    required this.delivery,
    this.couponText,
    required this.hasVariations,
    this.productAvailability,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        asin: json["asin"],
        productTitle: json["product_title"],
        productPrice: json["product_price"],
        productOriginalPrice: json["product_original_price"],
        currency: currencyValues.map[json["currency"]]!,
        productStarRating: json["product_star_rating"],
        productNumRatings: json["product_num_ratings"],
        productUrl: json["product_url"],
        productPhoto: json["product_photo"],
        productNumOffers: json["product_num_offers"],
        productMinimumOfferPrice: json["product_minimum_offer_price"],
        isBestSeller: json["is_best_seller"],
        isAmazonChoice: json["is_amazon_choice"],
        isPrime: json["is_prime"],
        climatePledgeFriendly: json["climate_pledge_friendly"],
        salesVolume: json["sales_volume"],
        delivery: json["delivery"],
        couponText: json["coupon_text"],
        hasVariations: json["has_variations"],
        productAvailability: json["product_availability"],
      );

  Map<String, dynamic> toJson() => {
        "asin": asin,
        "product_title": productTitle,
        "product_price": productPrice,
        "product_original_price": productOriginalPrice,
        "currency": currencyValues.reverse[currency],
        "product_star_rating": productStarRating,
        "product_num_ratings": productNumRatings,
        "product_url": productUrl,
        "product_photo": productPhoto,
        "product_num_offers": productNumOffers,
        "product_minimum_offer_price": productMinimumOfferPrice,
        "is_best_seller": isBestSeller,
        "is_amazon_choice": isAmazonChoice,
        "is_prime": isPrime,
        "climate_pledge_friendly": climatePledgeFriendly,
        "sales_volume": salesVolume,
        "delivery": delivery,
        "coupon_text": couponText,
        "has_variations": hasVariations,
        "product_availability": productAvailability,
      };
}

enum Currency { INR }

final currencyValues = EnumValues({"INR": Currency.INR});

class Parameters {
  final String query;
  final String country;
  final String sortBy;
  final int page;

  Parameters({
    required this.query,
    required this.country,
    required this.sortBy,
    required this.page,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        query: json["query"],
        country: json["country"],
        sortBy: json["sort_by"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "country": country,
        "sort_by": sortBy,
        "page": page,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
