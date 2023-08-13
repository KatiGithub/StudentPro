import 'dart:convert';

import 'package:business_frontend/models/user.dart';
import 'package:business_frontend/service/api_service.dart';
import 'package:business_frontend/shared/api_constants.dart';
import 'package:business_frontend/shared/exception/code_invalid.dart';
import 'package:business_frontend/shared/exception/email_not_verified.dart';
import 'package:business_frontend/shared/exception/login_unsuccessful.dart';
import 'package:business_frontend/shared/exception/registration_unsuccessful.dart';
import 'package:http/http.dart';

class UserService {
  APIService apiService = APIService();

  Future<User> login() {
    return apiService.get(APIConstants.userEndpoint+"/login").then((Response response) {
      if(response.statusCode == 200) {
        return User.toClass(jsonDecode(response.body));
      } else {
        throw LoginUnsuccessful();
      }
    });
  }

  Future<User> register() {
    return apiService.get(APIConstants.userEndpoint + "/register").then((Response response) {
      if(response.statusCode == 200) {
        return User.toClass(jsonDecode(response.body));
      } else {
        throw RegistrationUnsuccessful();
      }
    });
  }

  Future<User> getUserFromActivationCode() {
    apiService.queryParameters['code'] == null ? throw CodeInvalid() : () {};

    return apiService.get(APIConstants.userEndpoint).then((Response response) {
      if(response.statusCode == 200) {
        return User.toClass(jsonDecode(response.body));
      } else {
        throw CodeInvalid();
      }
    });
  }

  Future<void> emailVerifiedConfirm() {
    return apiService.put(APIConstants.userEndpoint + "/verify", jsonEncode({})).then((Response response) {
      if(response.statusCode != 200) {
        throw EmailNotVerified();
      }
    });
  }
}