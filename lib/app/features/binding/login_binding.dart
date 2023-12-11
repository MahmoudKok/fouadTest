import 'package:fouadtest/app/features/auth/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController());
  }
}
