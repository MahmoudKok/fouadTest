import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/app/features/home/home_controller.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformationSection extends StatelessWidget {
  InformationSection({super.key, this.pref});
  final SharedPreferences? pref;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Column(
            children: [
              InforCard(
                  icon: Icons.person_outlined, text: pref!.getString('name')),
              SizedBox(
                height: 30.h,
              ),
              InforCard(
                  icon: Icons.phone_android_rounded,
                  text:
                      '${pref!.getString('country_code')} ${pref!.getString('phone')}'),
              SizedBox(
                height: 30.h,
              ),
              InforCard(
                  icon: Icons.email_outlined, text: pref!.getString('email')),
            ],
          );
        });
  }
}

class InforCard extends StatelessWidget {
  InforCard({
    super.key,
    this.icon,
    this.text,
  });

  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.primary,
          size: 40.sp,
        ),
        SizedBox(
          width: 30.w,
        ),
        Text(
          text ?? 'user',
          style: TextStyle(
              color: AppColors.grey,
              fontSize: 28.sp,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
