import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:fouadtest/app/features/updateProfile/models/updateProfileModel.dart';
import 'package:fouadtest/app/features/updateProfile/update_profile_services.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  UpdateProfileServices _services = UpdateProfileServices();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selected_country;

  bool isUpdated = false;

  chooseNewCountry(Country country) {
    selected_country = '+${country.phoneCode}';
  }

  filValues(
      {String? newName, String? newEmail, String? newPhone, String? country}) {
    name.text = newName!;
    email.text = newEmail!;
    phone.text = newPhone!;
    selected_country = country;
  }

  updateProfile() async {
    UpdateProfileModel info = UpdateProfileModel(
        name: name.text,
        phone: phone.text,
        country_code: selected_country,
        email: email.text);
    try {
      var result = await _services.updateProfile(info);
      update(['update_info']);
      return result;
    } catch (e) {}
  }
}
