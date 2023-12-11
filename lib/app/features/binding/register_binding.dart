import 'package:fouadtest/app/features/auth/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RegisterController());
  }
}
