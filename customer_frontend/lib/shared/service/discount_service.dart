import 'dart:convert';

import 'package:http/http.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/transaction.dart';
import 'package:studio_projects/shared/api_constants.dart';
import 'package:studio_projects/shared/service/api_service.dart';

class DiscountService {
  APIService apiService = APIService();

  Future<Transaction> claimCoupon(int discountId) {
    return apiService.post("${APIConstants.transactionEndpoint}/claim/${discountId}", {}.toString()).then((Response response) {
      if(response.statusCode == 401) {
        throw Exception("Limit Reached");
      }
      String jsonBody = response.body;
      return Transaction.toClass(jsonDecode(jsonBody));
    });
  }

  Future<List<Discount>> getDiscountsByBusinessId(int businessId) {
    return apiService.get("${APIConstants.discountEndpoint}/business/${businessId}").then((Response response) {


      String jsonBody = response.body;
      List<dynamic> data = jsonDecode(jsonBody);
      List<Discount> discounts = [];

      data.forEach((e) {
        discounts.add(Discount.toClass(e));
      });

      return discounts;
    });
  }
}
