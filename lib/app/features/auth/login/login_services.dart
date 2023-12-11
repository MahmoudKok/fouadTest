import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fouadtest/src/helpers/functions.dart';
import 'package:fouadtest/src/helpers/strings.dart';
import 'package:fouadtest/src/models/user_data.dart';
import 'package:fouadtest/src/network/excptions.dart';
import 'package:fouadtest/src/network/server_config.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  login(String email, String password) async {
    try {
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        throw InterNetConnectionException(
            message:
                'Thers is no internet connection please check your internet and try again');
      } else {
        String url = '${ServerConfig.domainName}login';
        var response = await http.post(
          Uri.parse(url),
          body: {'email': email, 'password': password},
        );
        var result = jsonDecode(response.body);
        if (response.statusCode == 200) {
          var info = ApiResponse.fromJson(response.body);
          result = info.data;
          await saveUserInfoInStorage(info);
          return result;
        } else {
          throw FaildException(
              message: jsonDecode(response.body)['message'],
              statusCode: response.statusCode);
        }
      }
    } on FaildException catch (e) {
      return e.message;
    } on InterNetConnectionException catch (e) {
      return e.message;
    }
  }
}
