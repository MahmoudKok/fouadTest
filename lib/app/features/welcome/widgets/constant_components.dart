import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:fouadtest/src/theme/fonts_family.dart';

class BottomPhase extends StatelessWidget {
  const BottomPhase({
    super.key,
    required this.firstText,
    required this.secondText,
    this.onTap,
    this.withLine,
  });
  final firstText;
  final secondText;
  final onTap;
  final withLine;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: TextStyle(
              textBaseline: TextBaseline.alphabetic,
              color: AppColors.primary,
              fontFamily: AppFontsFamily.alixadnria,
              fontSize: 22.5.sp,
              letterSpacing: 0,
              fontWeight: FontWeight.w400),
        ),
        Text(
          secondText,
          style: TextStyle(
              textBaseline: TextBaseline.alphabetic,
              color: AppColors.primary,
              fontFamily: AppFontsFamily.alixadnria,
              decoration: withLine != null ? TextDecoration.underline : null,
              fontSize: 22.5.sp,
              letterSpacing: 0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class WelcomePhase extends StatelessWidget {
  const WelcomePhase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome to the app',
      style: TextStyle(
          letterSpacing: 00,
          color: AppColors.primary,
          fontSize: 41.sp,
          fontFamily: AppFontsFamily.alixadnria,
          fontWeight: FontWeight.bold),
    );
  }
}
