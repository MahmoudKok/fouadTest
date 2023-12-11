import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/app/features/welcome/widgets/constant_components.dart';
import 'package:fouadtest/src/common/main_button.dart';
import 'package:fouadtest/src/common/up_image.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/router/app_pages.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UpImage().pOnly(top: 42.h, bottom: 25.h),
            const WelcomePhase().pOnly(bottom: 300.h),
            MainButton(
              onTap: () {
                Get.toNamed(AppPages.login);
              },
              text: 'Login',
            ),
            MainButton(
              onTap: () {
                Get.toNamed(AppPages.register);
              },
              text: 'Register',
              textColor: AppColors.primary,
              borderColor: AppColors.primary,
              color: AppColors.white,
            ),
            const Spacer(
              flex: 8,
            ),
            const BottomPhase(
              firstText: 'Designed & Develped by ',
              secondText: 'Ali Fouad',
              withLine: true,
            ).pOnly(bottom: 15.h),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
