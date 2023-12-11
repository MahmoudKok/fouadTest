import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/app/features/updateProfile/update_profile_controller.dart';
import 'package:fouadtest/app/features/updateProfile/widgets/update_profile_form.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:fouadtest/src/theme/fonts_family.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.white,
            size: 30.sp,
          ),
          onPressed: () {
            Get.back(result: Get.find<UpdateProfileController>().isUpdated);
          },
        ),
      ),
      body: UpdateProfileForm(
        data: Get.parameters,
      ).pSymmetric(vertical: 30.h),
    );
  }
}
