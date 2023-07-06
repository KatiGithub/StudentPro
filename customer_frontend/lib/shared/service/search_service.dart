import 'dart:convert';

import 'package:http/http.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/service/api_service.dart';

import '../api_constants.dart';

class SearchService {
  APIService apiService = APIService();

  Future<List<Business>> searchByQuery(String query) {
    apiService.queryParameters["query"] = query;
    return apiService.get(APIConstants.searchEndpoint).then((Response response) {
      List<dynamic> data = jsonDecode(response.body);
      List<Business> businesses = [];

      data.forEach((e) => businesses.add(Business.toClass(e)));
      return businesses;
    });
  }

  Future<List<Business>> searchByLocation(double longitude, double latitude) {
    apiService.queryParameters["longitude"] = longitude.toString();
    apiService.queryParameters["latitude"] = latitude.toString();
    return apiService.get("${APIConstants.searchEndpoint}/location").then((Response response) {
      List<dynamic> data = jsonDecode(response.body);
      List<Business> businesses = [];

      data.forEach((e) => businesses.add(Business.toClass(e)));

      return businesses;
    });
  }

  Future<List<Business>> searchByCategory(int categoryId) {
    apiService.queryParameters["categoryId"] = categoryId.toString();
    return apiService.get("${APIConstants.searchEndpoint}/category").then((Response response) {
      List<dynamic> data = jsonDecode(response.body);
      List<Business> businesses = [];

      data.forEach((e) => businesses.add(Business.toClass(e)));
      return businesses;
    });
  }

  // Future<List<Business>> getSearchHistory() {
  //
  // }
}
