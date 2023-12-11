import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/app/features/home/home_controller.dart';
import 'package:fouadtest/app/features/home/widgets/home_action_section.dart';
import 'package:fouadtest/app/features/home/widgets/information_section.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:fouadtest/src/theme/fonts_family.dart';
import 'package:get/get.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: AppColors.white,
            fontFamily: AppFontsFamily.alixadnria,
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
          ),
        ).pOnly(top: 12.h),
      ),
      body: Column(
        children: [
          InformationSection(pref: Get.find<HomeController>().pref).pOnly(
            bottom: 30.h,
            left: 24.w,
            right: 24.w,
          ),
          HomeActionSection().pSymmetric(horizontal: 5.w),
        ],
      ).pSymmetric(vertical: 52.h),
    );
  }
}
