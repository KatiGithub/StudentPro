import 'dart:convert';

import 'package:http/http.dart';
import 'package:studio_projects/models/transaction.dart';
import 'package:studio_projects/shared/api_constants.dart';
import 'package:studio_projects/shared/service/api_service.dart';

class DiscountService {
  APIService apiService = APIService();

  Future<Transaction> claimCoupon(int discountId) {
    return apiService.post("${APIConstants.transactionEndpoint}/claim/${discountId}", {}.toString()).then((Response response) {
      String jsonBody = response.body;
      return Transaction.toClass(jsonDecode(jsonBody));
    });
  }
}
