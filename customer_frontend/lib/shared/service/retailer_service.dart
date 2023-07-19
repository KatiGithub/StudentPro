import 'package:studio_projects/shared/api_constants.dart';
import 'package:studio_projects/shared/service/api_service.dart';

class RetailerService {
  APIService apiService = APIService();

  Future<void> addBusinessUserClick(int retailerId) {
    apiService.queryParameters = {};
    apiService.queryParameters['retailerId'] = retailerId.toString();
    return apiService.post("${APIConstants.retailerEndpoint}/user", {}.toString()).then((_) {});
  }
}