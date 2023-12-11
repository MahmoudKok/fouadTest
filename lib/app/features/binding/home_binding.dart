import 'package:fouadtest/app/features/auth/login/login_controller.dart';
import 'package:fouadtest/app/features/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
  }
}
