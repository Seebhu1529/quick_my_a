class APIConstants {
  static String url = 'https://real-time-amazon-data.p.rapidapi.com';
  static String countryIN = "IN";
  static Map<String, String> headers = {
    'x-rapidapi-key': '6b996b4a5amshf7347944a4f3d7fp1c909ajsn51bdfee4f118',
    'x-rapidapi-host': 'real-time-amazon-data.p.rapidapi.com'
  };

  static String searchAPI({String? query, String? country, int? page}) {
    country ?? countryIN;
    query ?? 'Phone';
    page ?? 1;
    String endPoint =
        '/search?query=$query&page=$page&country=&sort_by=RELEVANCE&product_condition=ALL';
    return url + endPoint;
  }

  static String categoryAPI({String? category, String? country, int? page}) {
    country ?? countryIN;
    page ?? 1;
    String endPoint =
        '/products-by-category?category_id=2478868012&page=$page&country=$country&sort_by=RELEVANCE&product_condition=A';
    return url + endPoint;
  }

  static String offersAPI({String? country, int? page}) {
    country ?? countryIN;
    page ?? 1;
    String endPoint =
        '/product-offers?asin=B09SM24S8C&country=$country&limit=100&page=$page';
    return url + endPoint;
  }

  static String productDetailAPI({String? country, required String asin}) {
    country ?? countryIN;
    String endPoint =
        '/https://real-time-amazon-data.p.rapidapi.com/product-details?asin=B0CQG4RX37&country=IN';
    return url + endPoint;
  }
}
