import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/app/features/auth/login/widgets/components.dart';
import 'package:fouadtest/app/features/auth/login/widgets/login_form.dart';
import 'package:fouadtest/app/features/welcome/widgets/constant_components.dart';
import 'package:fouadtest/src/common/up_image.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/router/app_pages.dart';
import 'package:get/get.dart';

import 'package:pixel_perfect/pixel_perfect.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UpImage().pOnly(top: 42.h, bottom: 25.h),
            const LoginUpPhase().pOnly(bottom: 232.h),
            LoginForm(),
            SizedBox(
              height: 250.h,
            ),
            BottomPhase(
              firstText: 'Don\'t have an account? ',
              secondText: 'Register',
              onTap: () {
                Get.offAndToNamed(AppPages.register);
              },
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    ));
  }
}
