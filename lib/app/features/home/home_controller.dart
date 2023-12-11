import 'package:fouadtest/app/features/home/home_services.dart';
import 'package:fouadtest/app/features/home/models/change_password_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final HomeServices _services = HomeServices();
  SharedPreferences? pref;

  bool isDeleteOpen = false;

  openDeleteAccount() {
    isDeleteOpen = !isDeleteOpen;
    update(['delete_account']);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchData() async {
    pref = await SharedPreferences.getInstance();
  }

  changePassword(ChangePasswordModel info) async {
    try {
      var result = await _services.changePassword(info);
      return result;
    } catch (e) {}
  }

  deleteUserAccount() async {
    try {
      return await _services.deleteUserAccount();
    } catch (e) {
      print(e);
    }
  }
}
