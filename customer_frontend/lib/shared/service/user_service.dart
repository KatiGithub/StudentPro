import 'dart:convert';

import 'package:http/http.dart';
import 'package:studio_projects/shared/api_constants.dart';
import 'package:studio_projects/shared/exception/email_not_verified.dart';
import 'package:studio_projects/shared/exception/registration_unsuccessful.dart';
import 'package:studio_projects/shared/service/api_service.dart';

import '../../models/user.dart';

class UserService {
  APIService apiService = APIService();

  Future<User> register(User user) {
    return apiService.post(APIConstants.userEndpoint + "/register", user.toJson()).then((Response response) {
      if(response.statusCode == 200) {
        return User.toClass(jsonDecode(response.body));
      } else {
        throw RegistrationUnsuccessful();
      }
    });
  }

  Future<User> login() {
    return apiService.get(APIConstants.userEndpoint + "/login").then((Response response) {
      if (response.statusCode == 401) {
        throw EmailNotVerified();
      } else if (response.statusCode == 200) {
        return User.toClass(jsonDecode(response.body));
      } else {
        throw Exception("Unauthorized");
      }
    });
  }

  Future<void> emailVerifiedConfirm() {
    return apiService.put(APIConstants.userEndpoint + "/verify", {} as String).then((Response response) => {
      if(response.statusCode != 200) {
        throw Exception()
      }
    });
  }
}
