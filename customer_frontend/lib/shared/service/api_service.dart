import 'package:http/http.dart' as http;
import 'package:studio_projects/shared/api_constants.dart';
import 'package:studio_projects/shared/authentication/auth_service.dart';

class APIService {
  AuthService authService = AuthService();

  late Map<String, dynamic> queryParameters = Map<String, dynamic>();

  Future<http.Response> get(String endPoint) async {
    try {
      return authService.getIdToken().then((String? idToken) async {
        var url = Uri.http(APIConstants.baseUrl, endPoint, queryParameters);
        http.Response response = await http.get(url, headers: {"Authorization": "Bearer $idToken"});

        return response;
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<http.Response> post(String endPoint, String body) {
    try {
      return authService.getIdToken().then((String? idToken) async {
        var url = Uri.http(APIConstants.baseUrl, endPoint, queryParameters);
        http.Response response = await http.post(url, headers: {"Authorization": "Bearer $idToken"}, body: body);

        return response;
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  Future<http.Response> put(String endPoint, String body) {
    try {
      return authService.getIdToken().then((String? idToken) async {
        var url = Uri.http(APIConstants.baseUrl, endPoint, queryParameters);
        http.Response response = await http.put(url, headers:  {"Authorization": "Bearer $idToken"}, body: body);

        if(response.statusCode != 200) {
          throw Exception("An error occured.");
        }
        return response;
      });
    } catch(e) {
      throw Exception(e.toString());
    }
  }
}
