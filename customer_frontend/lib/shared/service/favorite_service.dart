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
}
