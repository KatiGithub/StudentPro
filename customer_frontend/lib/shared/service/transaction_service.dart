import 'package:http/http.dart';
import 'package:studio_projects/shared/api_constants.dart';
import 'package:studio_projects/shared/service/api_service.dart';

class TransactionService {
  APIService apiService = APIService();

  Future<bool> checkUserLimit(int discountId) {
    return apiService.get("${APIConstants.transactionEndpoint}/discount/$discountId").then((Response response) {
      return response.statusCode == 200;
    });
  }
}
