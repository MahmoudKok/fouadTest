import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/app/features/auth/login/login_controller.dart';
import 'package:fouadtest/src/common/custum_textField.dart';
import 'package:fouadtest/src/common/main_button.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/models/user_data.dart';
import 'package:fouadtest/src/router/app_pages.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:fouadtest/src/theme/fonts_family.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });
  LoginController _controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _controller.formKey,
        child: Column(
          children: [
            MainTextField(
              controller: _controller.email,
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
              label: 'Email Address',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
                width: 410.w,
                // height: 70.h,
                child: GetBuilder(
                  id: 'password_obscure',
                  init: LoginController(),
                  builder: (_) {
                    return TextFormField(
                      style: TextStyle(fontSize: 25.sp),
                      controller: _controller.password,
                      textAlign: TextAlign.center,
                      obscureText: _controller.isPasswordObscure,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password can not be empty';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 charcters';
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Password',
                          contentPadding:
                              EdgeInsets.only(left: 100.w, bottom: 70.h).h,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _controller.updateObscure();
                            },
                            child: Icon(
                              _controller.isPasswordObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.grey,
                              size: 38.sp,
                            ).pOnly(left: 18.w),
                          ),
                          errorMaxLines: 2,
                          hintStyle: TextStyle(
                              color: AppColors.grey,
                              fontFamily: AppFontsFamily.alixadnria,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide: BorderSide(
                                color: AppColors.primary,
                              ))),
                    );
                  },
                )),
            SizedBox(
              height: 55.h,
            ),
            MainButton(
              height: 70.h,
              onTap: () async {
                if (_controller.formKey.currentState!.validate()) {
                  EasyLoading.show(dismissOnTap: true);
                  var response = await _controller.login();
                  if (response is! UserData) {
                    EasyLoading.showError(response);
                  } else {
                    var pref = await SharedPreferences.getInstance();
                    EasyLoading.showSuccess(
                        'Welcome ${pref.getString('name')}');
                    Get.offAllNamed(AppPages.home);
                  }
                }
              },
              text: 'Login',
            ),
          ],
        ));
  }
}
