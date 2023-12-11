import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/app/features/auth/register/register_controller.dart';
import 'package:fouadtest/app/features/welcome/widgets/constant_components.dart';
import 'package:fouadtest/src/common/custum_textField.dart';
import 'package:fouadtest/src/common/main_button.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/router/app_pages.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:fouadtest/src/theme/fonts_family.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});
  RegisterController _controller = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Column(children: [
        MainTextField(
          controller: _controller.fullName,
          label: 'Full name',
          validator: (value) {
            if (!RegExp('[a-zA-Z]').hasMatch(value)) {
              return 'Please enter valid name';
            }
          },
        ).pOnly(bottom: 18.h),
        SizedBox(
            width: 415.w,
            child: PhoneFieldWithCountryPicker(
              controller: _controller.phoneNumber,
              onPick: (Country country) {
                print(country.isoCode);
                Get.find<RegisterController>().choseCountry(country);
              },
            )).pOnly(bottom: 18.h),
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
        ).pOnly(bottom: 18.h),
        GetBuilder<RegisterController>(
            init: RegisterController(),
            builder: (_) {
              return Column(
                children: [
                  MainTextField(
                    controller: _controller.password,
                    obscure: _controller.isPasswordObscure,
                    label: 'Password',
                    suffixTap: () {
                      _controller.updatePasswordObscure();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password can not be empty';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 charcters';
                      }
                    },
                  ).pOnly(bottom: 18.h),
                  MainTextField(
                    controller: _controller.passwordConfirm,
                    obscure: _controller.isConfirmPasswordObscure,
                    validator: (value) {
                      if (value != _controller.password.text) {
                        return 'Password not match';
                      }
                    },
                    label: 'Confirm Password',
                    suffixTap: () {
                      _controller.updateConfirmPasswordObscure();
                    },
                  ).pOnly(bottom: 18.h),
                ],
              );
            }),
      ]),
    );
  }
}

class PhoneFieldWithCountryPicker extends StatefulWidget {
  final onPick;
  final controller;
  const PhoneFieldWithCountryPicker(
      {Key? key, this.onPick, required this.controller})
      : super(key: key);
  @override
  _PhoneFieldWithCountryPickerState createState() =>
      _PhoneFieldWithCountryPickerState();
}

class _PhoneFieldWithCountryPickerState
    extends State<PhoneFieldWithCountryPicker> {
  String phoneNumber = '';
  Country selectedCountry = CountryPickerUtils.getCountryByIsoCode('US');
  bool isCountryPickerOpen = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        hintText: 'Phone number',
        hintStyle: TextStyle(
            color: AppColors.grey,
            fontFamily: AppFontsFamily.alixadnria,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: AppColors.primary,
          ),
        ),
        prefixIcon: SizedBox(
          width: 120.w,
          child: CountryPickerDropdown(
            initialValue: 'Ae',
            icon: const SizedBox(
              width: 0,
            ),
            itemBuilder: (Country country) {
              return Row(
                children: <Widget>[
                  SizedBox(
                          width: 50.w,
                          child:
                              CountryPickerUtils.getDefaultFlagImage(country))
                      .pOnly(left: 20.w),
                ],
              );
            },
            onValuePicked: widget.onPick,
          ),
        ),
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
