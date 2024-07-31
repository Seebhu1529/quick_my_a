import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../models/best_seller_model.dart';
import '/models/product_details.dart' as productdetails;
import '../../models/product_search.dart';
import '../../models/products.dart';

class APIService {
  static List<ProductModel> userModel = [];
  static Future fetchRecipes() async {
    // try {
    //   //* Working
    //   final url = Uri.parse(APIConstants.offersAPI());
    //   final response = await http.get(
    //     url,
    //     headers: APIConstants.headers,
    //   );
    //   if (response.statusCode == 200) {
    //     print(response.body);
    //     print("object");
    //   } else {
    //     throw Exception("Failed to load Data");
    //   }
    // } catch (e) {
    //   rethrow;
    // }

    try {
      final response = rootBundle.loadString("assets/json/best_sellers.json");
      final data = await response.then((value) {
        return value;
      });
      return bestSellersModelFromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<BestSeller>> bestSellerData() async {
    try {
      //* fatch from local
      final jsonString =
          await rootBundle.loadString("assets/json/best_sellers.json");
      BestSellersModel response = bestSellersModelFromJson(jsonString);
      return response.data.bestSellers;

      //* fatch from API
      // final reaponse = await http.get(Uri.parse(APIConstants.searchAPI());
      //final response = await http.get(
      //     url,
      //     headers: APIConstants.headers,
      //   );
      // if (reaponse.statusCode == 200) {
      //   BestSellersModel res = bestSellersModelFromJson(reaponse.body);
      //   return res.data.bestSellers;
      // } else {
      //   throw Exception("Failed to load post");
      // }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Product>> searchData({String? search}) async {
    try {
      //* fatch from local
      final jsonString =
          await rootBundle.loadString("assets/json/product_search.json");
      ProductSearchModel response = productSearchModelFromJson(jsonString);
      return response.data.products;

      //* fatch from API
      //  final url = Uri.parse(APIConstants.offersAPI());
      //   final response = await http.get(
      //     url,
      //     headers: APIConstants.headers,
      //   );
      // if (reaponse.statusCode == 200) {
      //   BestSellersModel res = bestSellersModelFromJson(reaponse.body);
      //   return res.data.bestSellers;
      // } else {
      //   throw Exception("Failed to load Data");
      // }
    } catch (e) {
      rethrow;
    }
  }

  static Future<productdetails.Data?> productDetailData() async {
    try {
      //* fatch from local
      final jsonString =
          await rootBundle.loadString("assets/json/product_details.json");
      print(jsonString);
      productdetails.ProductDetailsModel response =
          productdetails.productDetailsModelFromJson(jsonString);
      print(response);
      return response.data;

      //* fatch from API
      //   final url = Uri.parse(APIConstants.productDetailAPI(asin: asin));
      //   final response = await http.get(
      //     url,
      //     headers: APIConstants.headers,
      //   );
      //   if (response.statusCode == 200) {
      //     productdetails.ProductDetailsModel res =
      //         productdetails.productDetailsModelFromJson(response.body);
      //     print(res);
      //     return res.data;
      //   } else {
      //     throw Exception("Failed to load Data");
      //   }
    } catch (e) {
      rethrow;
    }
  }
}
