import 'package:http/http.dart';
import 'package:studio_projects/shared/api_constants.dart';
import 'package:studio_projects/shared/service/api_service.dart';

class ImageService {
  APIService apiService = APIService();

  Future<Response> getImage(String imageEndpontEnding) {
    apiService.queryParameters["imageRoute"] = imageEndpontEnding;
    return apiService.get("${APIConstants.imageEndpoint}");
  }
}