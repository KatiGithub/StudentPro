import 'dart:convert';

import 'package:http/http.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/api_constants.dart';
import 'package:studio_projects/shared/service/api_service.dart';

class HomeService {
  APIService apiService = APIService();

  Future<List<Business>> getRandomRetailers() async {
    return await apiService.get("${APIConstants.retailerEndpoint}/random").then((Response response) {
      String jsonBody = response.body;
      List<dynamic> data = jsonDecode(jsonBody);
      List<Business> businesses = [];

      for (var e in data) {
        businesses.add(Business.toClass(e));
      }

      return businesses;
    });
  }

  Future<List<Discount>> getRandomDiscounts() async {
    apiService.queryParameters = {
      "sort": "random"
    };
    return await apiService.get("${APIConstants.discountEndpoint}/").then((Response response) {
      String jsonBody = response.body;
      List<dynamic> data = jsonDecode(jsonBody);
      List<Discount> discounts = [];

      for (var e in data) {
        discounts.add(Discount.toClass(e));
      }

      return discounts;
    });
  }
}
