import 'package:fouadtest/src/models/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveUserInfoInStorage(ApiResponse info) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', info.data!.name!.toString());
  await prefs.setString('country_code', info.data!.country_code!.toString());
  await prefs.setString('phone', info.data!.phone!.toString());
  await prefs.setString('email', info.data!.email!.toString());
  await prefs.setString('token', info.data!.token!.toString());
}

logoutUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('name');
  await prefs.remove('country_code');
  await prefs.remove('phone');
  await prefs.remove('email');
  await prefs.remove('token');
}
