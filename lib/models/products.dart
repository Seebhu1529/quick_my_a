// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final String status;
  final String requestId;
  final List<Datum> data;

  ProductModel({
    required this.status,
    required this.requestId,
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        requestId: json["request_id"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request_id": requestId,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String productId;
  final String productTitle;
  final String productDescription;
  final List<String> productPhotos;
  final ProductAttributes productAttributes;
  final double? productRating;
  final String productPageUrl;
  final String productOffersPageUrl;
  final String productSpecsPageUrl;
  final String productReviewsPageUrl;
  final int productNumReviews;
  final String? productNumOffers;
  final List<String> typicalPriceRange;
  final Offer offer;

  Datum({
    required this.productId,
    required this.productTitle,
    required this.productDescription,
    required this.productPhotos,
    required this.productAttributes,
    required this.productRating,
    required this.productPageUrl,
    required this.productOffersPageUrl,
    required this.productSpecsPageUrl,
    required this.productReviewsPageUrl,
    required this.productNumReviews,
    required this.productNumOffers,
    required this.typicalPriceRange,
    required this.offer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        productTitle: json["product_title"],
        productDescription: json["product_description"],
        productPhotos: List<String>.from(json["product_photos"].map((x) => x)),
        productAttributes:
            ProductAttributes.fromJson(json["product_attributes"]),
        productRating: json["product_rating"]?.toDouble(),
        productPageUrl: json["product_page_url"],
        productOffersPageUrl: json["product_offers_page_url"],
        productSpecsPageUrl: json["product_specs_page_url"],
        productReviewsPageUrl: json["product_reviews_page_url"],
        productNumReviews: json["product_num_reviews"],
        productNumOffers: json["product_num_offers"],
        typicalPriceRange:
            List<String>.from(json["typical_price_range"].map((x) => x)),
        offer: Offer.fromJson(json["offer"]),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_title": productTitle,
        "product_description": productDescription,
        "product_photos": List<dynamic>.from(productPhotos.map((x) => x)),
        "product_attributes": productAttributes.toJson(),
        "product_rating": productRating,
        "product_page_url": productPageUrl,
        "product_offers_page_url": productOffersPageUrl,
        "product_specs_page_url": productSpecsPageUrl,
        "product_reviews_page_url": productReviewsPageUrl,
        "product_num_reviews": productNumReviews,
        "product_num_offers": productNumOffers,
        "typical_price_range":
            List<dynamic>.from(typicalPriceRange.map((x) => x)),
        "offer": offer.toJson(),
      };
}

class Offer {
  final String storeName;
  final dynamic storeRating;
  final String offerPageUrl;
  final int storeReviewCount;
  final dynamic storeReviewsPageUrl;
  final String price;
  final String shipping;
  final String tax;
  final bool onSale;
  final String? originalPrice;
  final ProductCondition productCondition;
  final bool topQualityStore;
  final String? couponCode;
  final String? couponDiscountPercent;
  final String? buyNowUrl;

  Offer({
    required this.storeName,
    required this.storeRating,
    required this.offerPageUrl,
    required this.storeReviewCount,
    required this.storeReviewsPageUrl,
    required this.price,
    required this.shipping,
    required this.tax,
    required this.onSale,
    required this.originalPrice,
    required this.productCondition,
    required this.topQualityStore,
    this.couponCode,
    this.couponDiscountPercent,
    this.buyNowUrl,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        storeName: json["store_name"],
        storeRating: json["store_rating"],
        offerPageUrl: json["offer_page_url"],
        storeReviewCount: json["store_review_count"],
        storeReviewsPageUrl: json["store_reviews_page_url"],
        price: json["price"],
        shipping: json["shipping"],
        tax: json["tax"],
        onSale: json["on_sale"],
        originalPrice: json["original_price"],
        productCondition:
            productConditionValues.map[json["product_condition"]]!,
        topQualityStore: json["top_quality_store"],
        couponCode: json["coupon_code"],
        couponDiscountPercent: json["coupon_discount_percent"],
        buyNowUrl: json["buy_now_url"],
      );

  Map<String, dynamic> toJson() => {
        "store_name": storeName,
        "store_rating": storeRating,
        "offer_page_url": offerPageUrl,
        "store_review_count": storeReviewCount,
        "store_reviews_page_url": storeReviewsPageUrl,
        "price": price,
        "shipping": shipping,
        "tax": tax,
        "on_sale": onSale,
        "original_price": originalPrice,
        "product_condition": productConditionValues.reverse[productCondition],
        "top_quality_store": topQualityStore,
        "coupon_code": couponCode,
        "coupon_discount_percent": couponDiscountPercent,
        "buy_now_url": buyNowUrl,
      };
}

enum ProductCondition { NEW }

final productConditionValues = EnumValues({"NEW": ProductCondition.NEW});

class ProductAttributes {
  final String department;
  final String size;
  final String material;
  final String? color;
  final String? features;
  final ClosureStyle? closureStyle;
  final Style? style;
  final String? athleticStyle;
  final String? toddlerDepartment;

  ProductAttributes({
    required this.department,
    required this.size,
    required this.material,
    this.color,
    this.features,
    this.closureStyle,
    this.style,
    this.athleticStyle,
    this.toddlerDepartment,
  });

  factory ProductAttributes.fromJson(Map<String, dynamic> json) =>
      ProductAttributes(
        department: json["Department"],
        size: json["Size"],
        material: json["Material"],
        color: json["Color"],
        features: json["Features"],
        closureStyle: closureStyleValues.map[json["Closure Style"]]!,
        style: styleValues.map[json["Style"]]!,
        athleticStyle: json["Athletic Style"],
        toddlerDepartment: json["Toddler Department"],
      );

  Map<String, dynamic> toJson() => {
        "Department": department,
        "Size": size,
        "Material": material,
        "Color": color,
        "Features": features,
        "Closure Style": closureStyleValues.reverse[closureStyle],
        "Style": styleValues.reverse[style],
        "Athletic Style": athleticStyle,
        "Toddler Department": toddlerDepartment,
      };
}

enum ClosureStyle { LACE_UP, LACE_UP_HOOK_AND_LOOP }

final closureStyleValues = EnumValues({
  "Lace-up": ClosureStyle.LACE_UP,
  "Lace-up, Hook and Loop": ClosureStyle.LACE_UP_HOOK_AND_LOOP
});

enum Style { CASUAL }

final styleValues = EnumValues({"Casual": Style.CASUAL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
