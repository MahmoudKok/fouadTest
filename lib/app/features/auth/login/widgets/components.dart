import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:fouadtest/src/theme/fonts_family.dart';

class LoginUpPhase extends StatelessWidget {
  const LoginUpPhase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Login',
      style: TextStyle(
          letterSpacing: 00,
          color: AppColors.primary,
          fontSize: 41.sp,
          fontFamily: AppFontsFamily.alixadnria,
          fontWeight: FontWeight.bold),
    );
  }
}
