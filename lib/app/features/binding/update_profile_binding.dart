import 'package:fouadtest/app/features/updateProfile/update_profile_controller.dart';
import 'package:get/get.dart';

class UpdateProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UpdateProfileController());
  }
}
