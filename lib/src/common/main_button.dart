import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:fouadtest/src/theme/fonts_family.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onTap,
    this.width,
    this.height,
    required this.text,
    this.bottomPadding,
    this.color,
    this.textColor,
    this.borderColor,
  });

  final onTap;
  final width;
  final height;
  final text;
  final bottomPadding;
  final color;
  final textColor;
  final borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 410.w,
        height: height ?? 70.h,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(15.r),
          border: borderColor == null
              ? null
              : Border.all(color: borderColor, width: 1),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor ?? AppColors.white,
                fontFamily: AppFontsFamily.alixadnria,
                fontWeight: FontWeight.bold,
                fontSize: 32.sp),
          ),
        ),
      ).pOnly(bottom: bottomPadding ?? 20.h),
    );
  }
}
