import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fouadtest/app/features/auth/register/models/register_model.dart';
import 'package:fouadtest/src/helpers/functions.dart';
import 'package:fouadtest/src/models/user_data.dart';
import 'package:fouadtest/src/helpers/strings.dart';
import 'package:fouadtest/src/network/excptions.dart';
import 'package:fouadtest/src/network/server_config.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService {
  checkInterNetConnection() async {
    return await (Connectivity().checkConnectivity());
  }

  registerUser(RegisterModel data) async {
    try {
      if (await checkInterNetConnection() == ConnectivityResult.none) {
        throw InterNetConnectionException(
            message:
                'Thers is no internet connection please check your internet and try again');
      } else {
        String url = '${ServerConfig.domainName}user/register';
        var response = await http.post(
          Uri.parse(url),
          body: data.toMap(),
        );
        var result = jsonDecode(response.body);
        if (response.statusCode == 201) {
          var info = ApiResponse.fromJson(response.body);
          result = info.data;
          await saveUserInfoInStorage(info);
          return result;
        } else if (response.statusCode == 400) {
          throw FaildException(
              message: jsonDecode(response.body)['message'],
              statusCode: response.statusCode);
        } else {
          throw FaildException(message: jsonDecode(response.body)['message']);
        }
      }
    } on FaildException catch (e) {
      return e.message;
    } on InterNetConnectionException catch (e) {
      return e.message;
    }
  }
}
