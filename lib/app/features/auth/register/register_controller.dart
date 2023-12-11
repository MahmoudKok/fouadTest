import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:fouadtest/app/features/auth/register/models/register_model.dart';
import 'package:fouadtest/app/features/auth/register/register_services.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final registerServices = RegisterService();

  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordObscure = false;
  bool isConfirmPasswordObscure = false;
  String selctedCountry = '+971';

  @override
  void onInit() async {
    super.onInit();
  }

  updatePasswordObscure() {
    isPasswordObscure = !isPasswordObscure;
    update();
  }

  updateConfirmPasswordObscure() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    update();
  }

  choseCountry(Country newCountry) {
    selctedCountry = '+$newCountry.phoneCode';
  }

  register() async {
    RegisterModel information = RegisterModel(
        name: fullName.text,
        email: email.text,
        phone: phoneNumber.text,
        password: password.text,
        country_code: selctedCountry,
        password_confirm: passwordConfirm.text);
    try {
      var response = await registerServices.registerUser(information);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
