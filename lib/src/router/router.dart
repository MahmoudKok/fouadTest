import 'package:fouadtest/app/features/auth/login/login_screen.dart';
import 'package:fouadtest/app/features/auth/register/register_screen.dart';
import 'package:fouadtest/app/features/binding/home_binding.dart';
import 'package:fouadtest/app/features/binding/login_binding.dart';
import 'package:fouadtest/app/features/binding/register_binding.dart';
import 'package:fouadtest/app/features/binding/update_profile_binding.dart';
import 'package:fouadtest/app/features/home/home_screen.dart';
import 'package:fouadtest/app/features/updateProfile/update_profile_screen.dart';
import 'package:fouadtest/app/features/welcome/welcome_screen.dart';
import 'package:fouadtest/src/router/app_pages.dart';
import 'package:get/get.dart';

class AppRouter {
  static final routes = [
    GetPage(name: AppPages.welcome, page: () => const WelcomeScreen()),
    GetPage(
        name: AppPages.register,
        page: () => const RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: AppPages.login,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppPages.home, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: AppPages.updateProfile,
        page: () => const UpdateProfileScreen(),
        binding: UpdateProfileBinding()),
  ];
}
