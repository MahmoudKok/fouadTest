import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/src/models/user_data.dart';
import 'package:fouadtest/app/features/auth/register/register_controller.dart';
import 'package:fouadtest/app/features/auth/register/widgets/register_form.dart';
import 'package:fouadtest/app/features/welcome/widgets/constant_components.dart';
import 'package:fouadtest/src/common/main_button.dart';
import 'package:fouadtest/src/common/up_image.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/helpers/strings.dart';
import 'package:fouadtest/src/router/app_pages.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:fouadtest/src/theme/fonts_family.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            const UpImage().pOnly(top: 36.h, bottom: 25.h),
            const RegisterUpPhase(),
            SizedBox(
              height: 80.h,
            ),
            RegisterForm(),
            SizedBox(
              height: 60.h,
            ),
            MainButton(
                onTap: () async {
                  if (Get.find<RegisterController>()
                      .formKey
                      .currentState!
                      .validate()) {
                    EasyLoading.show(dismissOnTap: true);

                    if (await Connectivity().checkConnectivity() ==
                        ConnectivityResult.none) {
                      EasyLoading.showError(Messages.NO_INTERNET_CONNNECTION);
                    } else {
                      var response =
                          await Get.find<RegisterController>().register();
                      if (response is! UserData) {
                        EasyLoading.showError(response);
                      } else {
                        var pref = await SharedPreferences.getInstance();
                        EasyLoading.showSuccess(
                            'Welcome ${pref.getString('name')}');
                        Get.offAllNamed(AppPages.home);
                      }
                    }
                  }
                },
                text: 'Register'),
            SizedBox(
              height: 40.h,
            ),
            BottomPhase(
              firstText: 'Already have an account? ',
              secondText: 'Login',
              onTap: () {
                Get.offNamed(AppPages.login);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      )),
    );
  }
}

class RegisterUpPhase extends StatelessWidget {
  const RegisterUpPhase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Register',
      style: TextStyle(
          letterSpacing: 00,
          color: AppColors.primary,
          fontSize: 41.sp,
          fontFamily: AppFontsFamily.alixadnria,
          fontWeight: FontWeight.bold),
    );
  }
}
