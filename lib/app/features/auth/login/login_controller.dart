
import 'package:flutter/material.dart';
import 'package:fouadtest/app/features/auth/login/login_services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginServices _loginServices = LoginServices();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isPasswordObscure = true;

  final formKey = GlobalKey<FormState>();

  updateObscure() {
    isPasswordObscure = !isPasswordObscure;
    update(['password_obscure']);
  }

  login() async {
    try {
      return await _loginServices.login(email.text ?? '', password.text ?? '');
    } catch (e) {}
  }
}
