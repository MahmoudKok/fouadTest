import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fouadtest/app/features/home/models/change_password_model.dart';
import 'package:fouadtest/src/helpers/strings.dart';
import 'package:fouadtest/src/models/user_data.dart';
import 'package:fouadtest/src/network/excptions.dart';
import 'package:fouadtest/src/network/server_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  changePassword(ChangePasswordModel info) async {
    try {
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        throw InterNetConnectionException(message: Messages.INTERNAL_EXCEPTION);
      } else {
        String url = '${ServerConfig.domainName}user/changepassword';
        String token = '';

        await SharedPreferences.getInstance().then((value) {
          if (value.getString('token') != null) {
            token = value.getString('token')!;
            print(token);
          } else {
            throw InternalException(message: Messages.INTERNAL_EXCEPTION);
          }
        });
        var response =
            await http.post(Uri.parse(url), body: info.toMap(), headers: {
          'Authorization': 'Bearer $token',
        });

        if (response.statusCode == 200) {
          return true;
        } else {
          throw FaildException(
              message: ApiResponse.fromJson(response.body).message);
        }
      }
    } on InterNetConnectionException catch (e) {
      return e.message;
    } on InternalException catch (e) {
      return e.message;
    } on FaildException catch (e) {
      return e.message;
    }
  }

  deleteUserAccount() async {
    try {
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        throw InterNetConnectionException(message: Messages.INTERNAL_EXCEPTION);
      } else {
        String url = '${ServerConfig.domainName}user/delete';
        String token = '';

        await SharedPreferences.getInstance().then((value) {
          if (value.getString('token') != null) {
            token = value.getString('token')!;
            print(token);
          } else {
            throw InternalException(message: Messages.INTERNAL_EXCEPTION);
          }
        });
        var response = await http.delete(Uri.parse(url), headers: {
          'Authorization': 'Bearer $token',
        });

        if (response.statusCode == 200) {
          return true;
        } else {
          throw FaildException(
              message: ApiResponse.fromJson(response.body).message);
        }
      }
    } on InterNetConnectionException catch (e) {
      return e.message;
    } on InternalException catch (e) {
      return e.message;
    } on FaildException catch (e) {
      return e.message;
    }
  }
}
