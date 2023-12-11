import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/router/app_pages.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:fouadtest/src/theme/fonts_family.dart';
import 'package:get/get.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppPages.register);
      },
      child: Container(
        width: 410.w,
        height: 70.h,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: AppColors.primary, width: 1)),
        child: Center(
          child: Text(
            'Register',
            style: TextStyle(
                color: AppColors.primary,
                fontFamily: AppFontsFamily.alixadnria,
                fontWeight: FontWeight.bold,
                fontSize: 32.sp),
          ),
        ),
      ).pOnly(bottom: 20.h),
    );
  }
}
