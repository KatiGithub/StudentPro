import 'package:business_frontend/shared/api_constants.dart';
import 'package:business_frontend/shared/authentication/auth_service.dart';
import 'package:http/http.dart' as http;

class APIService {
  AuthService authService = AuthService();

  late Map<String, dynamic> queryParameters = Map<String, dynamic>();

  Future<http.Response> get(String endPoint) async {
    try {
      var url = Uri.http(APIConstants.baseUrl, endPoint, queryParameters);
      var idToken =
          authService.getCurrentToken() != "" ? authService.getCurrentToken() : (await authService.getIdToken());

      return http.get(url, headers: {"Authorization": "Bearer $idToken"}).then((http.Response response) {
        return response;
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<http.Response> post(String endPoint, String body) async {
    try {
      var url = Uri.http(APIConstants.baseUrl, endPoint, queryParameters);
      var idToken =
          authService.getCurrentToken() != "" ? authService.getCurrentToken() : (await authService.getIdToken());

      return http.post(url, headers: {"Authorization": "Bearer $idToken"}, body: body).then((http.Response response) {
        return response;
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<http.Response> put(String endPoint, String body) async {
    try {
      var url = Uri.http(APIConstants.baseUrl, endPoint, queryParameters);
      var idToken =
          authService.getCurrentToken() != "" ? authService.getCurrentToken() : (await authService.getIdToken());

      return http.put(url, headers: {"Authorization": "Bearer $idToken"}, body: body).then((http.Response response) {
        return response;
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
