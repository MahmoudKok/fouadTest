import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fouadtest/app/features/updateProfile/models/updateProfileModel.dart';
import 'package:fouadtest/app/features/updateProfile/models/update_profile_response_model.dart';
import 'package:fouadtest/src/helpers/strings.dart';
import 'package:fouadtest/src/network/excptions.dart';
import 'package:fouadtest/src/network/server_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class UpdateProfileServices {
  updateProfile(UpdateProfileModel info) async {
    try {
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        throw InterNetConnectionException(
            message: Messages.NO_INTERNET_CONNNECTION);
      } else {
        String url = '${ServerConfig.domainName}user/update';
        String token = '';

        await SharedPreferences.getInstance().then((value) {
          if (value.getString('token') != null) {
            token = value.getString('token')!;
          } else {
            throw InternalException(message: Messages.INTERNAL_EXCEPTION);
          }
        });
        var response =
            await http.post(Uri.parse(url), body: info.toMap(), headers: {
          'Authorization': 'Bearer $token',
        });
        var result = jsonDecode(response.body);
        if (response.statusCode == 200) {
          var info = UpdateProfileApiResponse.fromJson(response.body).data;
          _saveNewValues(info!);
          return info;
        } else {
          throw FaildException(message: result['message']);
        }
      }
    } on InterNetConnectionException catch (e) {
      return e.message;
    } on FaildException catch (e) {
      return e.message;
    } catch (e) {
      print(e);
    }
  }
}

_saveNewValues(UpdateProfileModel info) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', info.name!.toString());
  await prefs.setString('country_code', info.country_code!.toString());
  await prefs.setString('phone', info.phone!.toString());
  await prefs.setString('email', info.email!.toString());
}
