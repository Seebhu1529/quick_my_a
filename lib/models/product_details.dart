// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  final String? status;
  final String? requestId;
  final Parameters? parameters;
  final Data? data;

  ProductDetailsModel({
    this.status,
    this.requestId,
    this.parameters,
    this.data,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        status: json["status"],
        requestId: json["request_id"],
        parameters: json["parameters"] == null
            ? null
            : Parameters.fromJson(json["parameters"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request_id": requestId,
        "parameters": parameters?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  final String? asin;
  final String? productTitle;
  final String? productPrice;
  final dynamic productOriginalPrice;
  final String? currency;
  final String? country;
  final String? productStarRating;
  final int? productNumRatings;
  final String? productUrl;
  final String? productPhoto;
  final int? productNumOffers;
  final String? productAvailability;
  final bool? isBestSeller;
  final bool? isAmazonChoice;
  final bool? isPrime;
  final bool? climatePledgeFriendly;
  final dynamic salesVolume;
  final List<String>? aboutProduct;
  final String? productDescription;
  final ProductInformation? productInformation;
  final List<String>? productPhotos;
  final ProductDetails? productDetails;
  final String? customersSay;
  final List<CategoryPath>? categoryPath;
  final ProductVariations? productVariations;

  Data({
    this.asin,
    this.productTitle,
    this.productPrice,
    this.productOriginalPrice,
    this.currency,
    this.country,
    this.productStarRating,
    this.productNumRatings,
    this.productUrl,
    this.productPhoto,
    this.productNumOffers,
    this.productAvailability,
    this.isBestSeller,
    this.isAmazonChoice,
    this.isPrime,
    this.climatePledgeFriendly,
    this.salesVolume,
    this.aboutProduct,
    this.productDescription,
    this.productInformation,
    this.productPhotos,
    this.productDetails,
    this.customersSay,
    this.categoryPath,
    this.productVariations,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        asin: json["asin"],
        productTitle: json["product_title"],
        productPrice: json["product_price"],
        productOriginalPrice: json["product_original_price"],
        currency: json["currency"],
        country: json["country"],
        productStarRating: json["product_star_rating"],
        productNumRatings: json["product_num_ratings"],
        productUrl: json["product_url"],
        productPhoto: json["product_photo"],
        productNumOffers: json["product_num_offers"],
        productAvailability: json["product_availability"],
        isBestSeller: json["is_best_seller"],
        isAmazonChoice: json["is_amazon_choice"],
        isPrime: json["is_prime"],
        climatePledgeFriendly: json["climate_pledge_friendly"],
        salesVolume: json["sales_volume"],
        aboutProduct: json["about_product"] == null
            ? []
            : List<String>.from(json["about_product"]!.map((x) => x)),
        productDescription: json["product_description"],
        productInformation: json["product_information"] == null
            ? null
            : ProductInformation.fromJson(json["product_information"]),
        productPhotos: json["product_photos"] == null
            ? []
            : List<String>.from(json["product_photos"]!.map((x) => x)),
        productDetails: json["product_details"] == null
            ? null
            : ProductDetails.fromJson(json["product_details"]),
        customersSay: json["customers_say"],
        categoryPath: json["category_path"] == null
            ? []
            : List<CategoryPath>.from(
                json["category_path"]!.map((x) => CategoryPath.fromJson(x))),
        productVariations: json["product_variations"] == null
            ? null
            : ProductVariations.fromJson(json["product_variations"]),
      );

  Map<String, dynamic> toJson() => {
        "asin": asin,
        "product_title": productTitle,
        "product_price": productPrice,
        "product_original_price": productOriginalPrice,
        "currency": currency,
        "country": country,
        "product_star_rating": productStarRating,
        "product_num_ratings": productNumRatings,
        "product_url": productUrl,
        "product_photo": productPhoto,
        "product_num_offers": productNumOffers,
        "product_availability": productAvailability,
        "is_best_seller": isBestSeller,
        "is_amazon_choice": isAmazonChoice,
        "is_prime": isPrime,
        "climate_pledge_friendly": climatePledgeFriendly,
        "sales_volume": salesVolume,
        "about_product": aboutProduct == null
            ? []
            : List<dynamic>.from(aboutProduct!.map((x) => x)),
        "product_description": productDescription,
        "product_information": productInformation?.toJson(),
        "product_photos": productPhotos == null
            ? []
            : List<dynamic>.from(productPhotos!.map((x) => x)),
        "product_details": productDetails?.toJson(),
        "customers_say": customersSay,
        "category_path": categoryPath == null
            ? []
            : List<dynamic>.from(categoryPath!.map((x) => x.toJson())),
        "product_variations": productVariations?.toJson(),
      };
}

class CategoryPath {
  final String? id;
  final String? name;
  final String? link;

  CategoryPath({
    this.id,
    this.name,
    this.link,
  });

  factory CategoryPath.fromJson(Map<String, dynamic> json) => CategoryPath(
        id: json["id"],
        name: json["name"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
      };
}

class ProductDetails {
  final String? brand;
  final String? operatingSystem;
  final String? ramMemoryInstalledSize;
  final String? memoryStorageCapacity;
  final String? screenSize;
  final String? modelName;
  final String? wirelessCarrier;
  final String? cellularTechnology;
  final String? connectivityTechnology;
  final String? color;

  ProductDetails({
    this.brand,
    this.operatingSystem,
    this.ramMemoryInstalledSize,
    this.memoryStorageCapacity,
    this.screenSize,
    this.modelName,
    this.wirelessCarrier,
    this.cellularTechnology,
    this.connectivityTechnology,
    this.color,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        brand: json["Brand"],
        operatingSystem: json["Operating System"],
        ramMemoryInstalledSize: json["Ram Memory Installed Size"],
        memoryStorageCapacity: json["Memory Storage Capacity"],
        screenSize: json["Screen Size"],
        modelName: json["Model Name"],
        wirelessCarrier: json["Wireless Carrier"],
        cellularTechnology: json["Cellular Technology"],
        connectivityTechnology: json["Connectivity Technology"],
        color: json["Color"],
      );

  Map<String, dynamic> toJson() => {
        "Brand": brand,
        "Operating System": operatingSystem,
        "Ram Memory Installed Size": ramMemoryInstalledSize,
        "Memory Storage Capacity": memoryStorageCapacity,
        "Screen Size": screenSize,
        "Model Name": modelName,
        "Wireless Carrier": wirelessCarrier,
        "Cellular Technology": cellularTechnology,
        "Connectivity Technology": connectivityTechnology,
        "Color": color,
      };
}

class ProductInformation {
  final String? productDimensions;
  final String? itemWeight;
  final String? asin;
  final String? itemModelNumber;
  final String? batteries;
  final String? bestSellersRank;
  final String? os;
  final String? ram;
  final String? wirelessCommunicationTechnologies;
  final String? connectivityTechnologies;
  final String? gps;
  final String? specialFeatures;
  final String? otherDisplayFeatures;
  final String? humanInterfaceInput;
  final String? otherCameraFeatures;
  final String? formFactor;
  final String? color;
  final String? batteryPowerRating;
  final String? whatsInTheBox;
  final String? manufacturer;
  final String? dateFirstAvailable;
  final String? memoryStorageCapacity;
  final String? standingScreenDisplaySize;
  final String? ramMemoryInstalledSize;
  final String? weight;

  ProductInformation({
    this.productDimensions,
    this.itemWeight,
    this.asin,
    this.itemModelNumber,
    this.batteries,
    this.bestSellersRank,
    this.os,
    this.ram,
    this.wirelessCommunicationTechnologies,
    this.connectivityTechnologies,
    this.gps,
    this.specialFeatures,
    this.otherDisplayFeatures,
    this.humanInterfaceInput,
    this.otherCameraFeatures,
    this.formFactor,
    this.color,
    this.batteryPowerRating,
    this.whatsInTheBox,
    this.manufacturer,
    this.dateFirstAvailable,
    this.memoryStorageCapacity,
    this.standingScreenDisplaySize,
    this.ramMemoryInstalledSize,
    this.weight,
  });

  factory ProductInformation.fromJson(Map<String, dynamic> json) =>
      ProductInformation(
        productDimensions: json["Product Dimensions"],
        itemWeight: json["Item Weight"],
        asin: json["ASIN"],
        itemModelNumber: json["Item model number"],
        batteries: json["Batteries"],
        bestSellersRank: json["Best Sellers Rank"],
        os: json["OS"],
        ram: json["RAM"],
        wirelessCommunicationTechnologies:
            json["Wireless communication technologies"],
        connectivityTechnologies: json["Connectivity technologies"],
        gps: json["GPS"],
        specialFeatures: json["Special features"],
        otherDisplayFeatures: json["Other display features"],
        humanInterfaceInput: json["Human Interface Input"],
        otherCameraFeatures: json["Other camera features"],
        formFactor: json["Form Factor"],
        color: json["Color"],
        batteryPowerRating: json["Battery Power Rating"],
        whatsInTheBox: json["Whats in the box"],
        manufacturer: json["Manufacturer"],
        dateFirstAvailable: json["Date First Available"],
        memoryStorageCapacity: json["Memory Storage Capacity"],
        standingScreenDisplaySize: json["Standing screen display size"],
        ramMemoryInstalledSize: json["Ram Memory Installed Size"],
        weight: json["Weight"],
      );

  Map<String, dynamic> toJson() => {
        "Product Dimensions": productDimensions,
        "Item Weight": itemWeight,
        "ASIN": asin,
        "Item model number": itemModelNumber,
        "Batteries": batteries,
        "Best Sellers Rank": bestSellersRank,
        "OS": os,
        "RAM": ram,
        "Wireless communication technologies":
            wirelessCommunicationTechnologies,
        "Connectivity technologies": connectivityTechnologies,
        "GPS": gps,
        "Special features": specialFeatures,
        "Other display features": otherDisplayFeatures,
        "Human Interface Input": humanInterfaceInput,
        "Other camera features": otherCameraFeatures,
        "Form Factor": formFactor,
        "Color": color,
        "Battery Power Rating": batteryPowerRating,
        "Whats in the box": whatsInTheBox,
        "Manufacturer": manufacturer,
        "Date First Available": dateFirstAvailable,
        "Memory Storage Capacity": memoryStorageCapacity,
        "Standing screen display size": standingScreenDisplaySize,
        "Ram Memory Installed Size": ramMemoryInstalledSize,
        "Weight": weight,
      };
}

class ProductVariations {
  final List<ServiceProvider>? size;
  final List<Color>? color;
  final List<ServiceProvider>? serviceProvider;

  ProductVariations({
    this.size,
    this.color,
    this.serviceProvider,
  });

  factory ProductVariations.fromJson(Map<String, dynamic> json) =>
      ProductVariations(
        size: json["size"] == null
            ? []
            : List<ServiceProvider>.from(
                json["size"]!.map((x) => ServiceProvider.fromJson(x))),
        color: json["color"] == null
            ? []
            : List<Color>.from(json["color"]!.map((x) => Color.fromJson(x))),
        serviceProvider: json["service_provider"] == null
            ? []
            : List<ServiceProvider>.from(json["service_provider"]!
                .map((x) => ServiceProvider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "size": size == null
            ? []
            : List<dynamic>.from(size!.map((x) => x.toJson())),
        "color": color == null
            ? []
            : List<dynamic>.from(color!.map((x) => x.toJson())),
        "service_provider": serviceProvider == null
            ? []
            : List<dynamic>.from(serviceProvider!.map((x) => x.toJson())),
      };
}

class Color {
  final String? asin;
  final String? value;
  final String? photo;
  final bool? isAvailable;

  Color({
    this.asin,
    this.value,
    this.photo,
    this.isAvailable,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        asin: json["asin"],
        value: json["value"],
        photo: json["photo"],
        isAvailable: json["is_available"],
      );

  Map<String, dynamic> toJson() => {
        "asin": asin,
        "value": value,
        "photo": photo,
        "is_available": isAvailable,
      };
}

class ServiceProvider {
  final String? asin;
  final String? value;
  final bool? isAvailable;

  ServiceProvider({
    this.asin,
    this.value,
    this.isAvailable,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      ServiceProvider(
        asin: json["asin"],
        value: json["value"],
        isAvailable: json["is_available"],
      );

  Map<String, dynamic> toJson() => {
        "asin": asin,
        "value": value,
        "is_available": isAvailable,
      };
}

class Parameters {
  final String? asin;
  final String? country;

  Parameters({
    this.asin,
    this.country,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        asin: json["asin"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "asin": asin,
        "country": country,
      };
}
