import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/app/features/home/home_controller.dart';
import 'package:fouadtest/app/features/home/models/change_password_model.dart';
import 'package:fouadtest/src/common/custum_textField.dart';
import 'package:fouadtest/src/common/main_button.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/helpers/functions.dart';
import 'package:fouadtest/src/router/app_pages.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:fouadtest/src/theme/fonts_family.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';

class HomeActionSection extends StatelessWidget {
  HomeActionSection({super.key});
  final HomeController _controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeActionCard(
            text: 'Update Information',
            onTap: () async {
              var isUpdate =
                  await Get.toNamed(AppPages.updateProfile, parameters: {
                'name': _controller.pref!.getString('name')!,
                'country_code': _controller.pref!.getString('country_code')!,
                'phone': _controller.pref!.getString('phone')!,
                'email': _controller.pref!.getString('email')!,
              });
              if (isUpdate) {
                _controller.update();
              }
            }),
        HomeActionCard(
            text: 'Change Password',
            onTap: () {
              TextEditingController password = TextEditingController();
              TextEditingController password_confirm = TextEditingController();
              TextEditingController current_password = TextEditingController();
              final formKey = GlobalKey<FormState>();
              changePasswordDialog(
                  formKey, password, password_confirm, current_password);
            }),
        HomeActionCard(
            text: 'Delete Account',
            onTap: () async {
              deleteAccountDialog();
            }),
        HomeActionCard(
            text: 'Logout',
            onTap: () async {
              await logoutUser();
              Get.offAndToNamed(AppPages.welcome);
            })
      ],
    );
  }

  Future<dynamic> deleteAccountDialog() {
    return Get.defaultDialog(
        barrierDismissible: false,
        title: 'Delete account',
        titleStyle: TextStyle(
          color: AppColors.black,
          fontSize: 35.sp,
          fontWeight: FontWeight.bold,
          fontFamily: AppFontsFamily.alixadnria,
        ),
        content: Text(
          'Are you sure you want to delete your account?',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 35.sp,
            fontWeight: FontWeight.bold,
            fontFamily: AppFontsFamily.alixadnria,
          ),
        ),
        confirm: GetBuilder<HomeController>(
            id: 'delete_account',
            init: HomeController(),
            builder: (_) {
              return Container(
                width: 140.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: _controller.isDeleteOpen
                      ? Colors.redAccent
                      : AppColors.grey,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: _controller.isDeleteOpen
                    ? MainButton(
                        width: 140.w,
                        height: 80.h,
                        color: Colors.redAccent,
                        onTap: () async {
                          try {
                            Get.back();
                            EasyLoading.show(dismissOnTap: true);
                            var result = await _controller.deleteUserAccount();
                            if (result is bool) {
                              EasyLoading.showSuccess(
                                  'Your account deleted successfully');
                              logoutUser();
                              await Future.delayed(const Duration(seconds: 3));
                              Get.offAndToNamed(AppPages.welcome);
                            } else {
                              EasyLoading.showError(result);
                            }
                          } catch (e) {}
                        },
                        text: 'Confirm',
                      )
                    : Countdown(
                        onFinished: () {
                          _controller.openDeleteAccount();
                        },
                        seconds: 5,
                        build: (BuildContext context, double timer) {
                          return Center(
                            child: Text(
                              timer.toString(),
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 35.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppFontsFamily.alixadnria,
                              ),
                            ),
                          );
                        },
                      ),
              );
            }),
        cancel: MainButton(
          width: 140.w,
          height: 80.h,
          color: AppColors.black.withOpacity(0),
          textColor: AppColors.black,
          onTap: () {
            _controller.isDeleteOpen = false;
            Get.back();
          },
          text: 'Cancel',
        ));
  }

  Future<dynamic> changePasswordDialog(
      GlobalKey<FormState> formKey,
      TextEditingController password,
      TextEditingController password_confirm,
      TextEditingController current_password) {
    return Get.defaultDialog(
      title: 'Change Password',
      titleStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 35.sp,
          fontFamily: AppFontsFamily.alixadnria,
          fontWeight: FontWeight.bold),
      content: Form(
        key: formKey,
        child: Column(
          children: [
            MainTextField(
                controller: password,
                label: 'Enter new password',
                validator: (String? value) {
                  if (value!.length <= 0) {
                    return 'Password must be at least 8 charcters';
                  }
                  if (value!.isEmpty) {
                    return 'Password can not be empty';
                  }
                }).pSymmetric(
              vertical: 10.h,
            ),
            MainTextField(
              controller: password_confirm,
              label: 'confirm password',
              validator: (value) {
                if (value != password.text) {
                  return 'Passwords must match';
                }

                if (value!.length <= 0) {
                  return 'Password must be at least 8 charcters';
                }
                if (value!.isEmpty) {
                  return 'Password can not be empty';
                }
              },
            ).pSymmetric(vertical: 10.h),
            MainTextField(
                controller: current_password,
                label: 'Enter current password',
                validator: (String? value) {
                  if (value!.length <= 0) {
                    return 'Password must be at least 8 charcters';
                  }
                  if (value!.isEmpty) {
                    return 'Password can not be empty';
                  }
                }).pSymmetric(vertical: 20.h),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
      actions: [
        MainButton(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                try {
                  Get.back();
                  EasyLoading.show(dismissOnTap: true);
                  var result = await _controller.changePassword(
                      ChangePasswordModel(
                          password: password.text,
                          password_confirm: password_confirm.text,
                          current_password: current_password.text));
                  if (result is bool) {
                    EasyLoading.showSuccess('Password updated successfully');
                  } else {
                    EasyLoading.showError(
                        'Somthing went wrong please try again later');
                  }
                } catch (e) {
                  print(e);
                }
              }
            },
            text: 'Confirm'),
        MainButton(
          onTap: () {
            Get.back();
          },
          text: 'cancel',
          color: AppColors.grey.withOpacity(0),
          textColor: AppColors.black,
        ),
      ],
    );
  }
}

class HomeActionCard extends StatelessWidget {
  const HomeActionCard({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String? text;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.5),
                  offset: const Offset(0, 1),
                  blurRadius: 0.1)
            ],
            border: Border.all(color: AppColors.white, width: 0)),
        child: Padding(
          padding:
              EdgeInsets.only(top: 14.h, bottom: 16.h, left: 29.w, right: 28.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text!,
                style: TextStyle(
                    color: AppColors.primary,
                    fontFamily: AppFontsFamily.alixadnria,
                    fontWeight: FontWeight.w700,
                    fontSize: 30.sp),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 40.sp,
                color: AppColors.primary,
              )
            ],
          ),
        ),
      ).pOnly(bottom: 10.h),
    );
  }
}
