import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/app/features/auth/register/widgets/register_form.dart';
import 'package:fouadtest/app/features/updateProfile/models/updateProfileModel.dart';
import 'package:fouadtest/app/features/updateProfile/update_profile_controller.dart';
import 'package:fouadtest/src/common/custum_textField.dart';
import 'package:fouadtest/src/common/main_button.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:get/get.dart';

class UpdateProfileForm extends StatelessWidget {
  UpdateProfileForm({super.key, this.data});
  final UpdateProfileController _controller =
      Get.find<UpdateProfileController>();
  Map<String, String?>? data;

  @override
  Widget build(BuildContext context) {
    _controller.filValues(
        newName: data!['name'],
        newEmail: data!['email'],
        country: data!['country_code'],
        newPhone: data!['phone']);
    return GetBuilder<UpdateProfileController>(
        id: 'update_info',
        init: UpdateProfileController(),
        builder: (_) {
          return Form(
              key: _controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MainTextField(
                    controller: _controller.name,
                    label: 'Full name',
                    validator: (value) {
                      if (!RegExp('[a-zA-Z]').hasMatch(value)) {
                        return 'Please enter valid name';
                      }
                    },
                  ).pOnly(bottom: 25.h),
                  PhoneFieldWithCountryPicker(
                    controller: _controller.phone,
                    onPick: (Country country) {
                      _controller.chooseNewCountry(country);
                    },
                  ).pOnly(bottom: 25.h, left: 90.w, right: 90.w),
                  MainTextField(
                    controller: _controller.email,
                    label: 'Email Address',
                    validator: (value) {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                        return 'Email addres not valid';
                      }
                      if (value.isEmpty) {
                        return 'Email addres can not be empty';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ).pOnly(bottom: 40.h),
                  MainButton(
                      onTap: () async {
                        if (_controller.formKey.currentState!.validate()) {
                          try {
                            EasyLoading.show(dismissOnTap: true);
                            var result = await _controller.updateProfile();
                            if (result is! UpdateProfileModel) {
                              EasyLoading.showError(result);
                            } else {
                              EasyLoading.dismiss();
                              _controller.isUpdated = true;
                              Get.back(
                                  result: Get.find<UpdateProfileController>()
                                      .isUpdated);
                              Get.snackbar(
                                'Success',
                                'Your information updated successfully',
                                backgroundColor: AppColors.green,
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: AppColors.white,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 30.h),
                                messageText: SizedBox(
                                  height: 80.h, // Set your desired height
                                  child: Text(
                                    'Your information updated successfully',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25.sp),
                                  ),
                                ),
                              );
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      text: 'Save'),
                ],
              ));
        });
  }
}
