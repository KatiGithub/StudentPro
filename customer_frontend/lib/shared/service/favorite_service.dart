import 'dart:convert';

import 'package:http/http.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/api_constants.dart';
import 'package:studio_projects/shared/service/api_service.dart';
import 'package:studio_projects/views/main/favorite/favorite_state.dart';

class FavoriteService {
  APIService apiService = APIService();

  Future<List<Business>> getFavoriteRetailers() {
    return apiService.get("${APIConstants.favoriteEndpoint}/retailer").then(
            (Response response) {
              String jsonBody = response.body;
              List<dynamic> data = jsonDecode(jsonBody);
              List<Business> businesses = [];

              data.forEach((e) => businesses.add(Business.toClass(e["business"])));
              return businesses;
            }
    );
  }

  Future<bool> checkFavoriteRetailer(int businessId) async {
    apiService.queryParameters['businessId'] = businessId.toString();
    return await apiService.get("${APIConstants.favoriteEndpoint}/user").then((Response response) {
      return response.statusCode == 200;
    });
  }

  Future<void> favoritePress(int businessId) async {
    apiService.queryParameters['businessId'] = businessId.toString();
    return await apiService.post("${APIConstants.favoriteEndpoint}/retailer", {}.toString())
        .then((Response response) {
      if(response.statusCode != 200) {
        throw new Exception("An error occured while liking/disliking");
      }
    });
  }
}
