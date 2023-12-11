import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/app/features/auth/register/widgets/country_picker.dart';
import 'package:fouadtest/src/helpers/extension.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:fouadtest/src/theme/fonts_family.dart';

class MainTextField extends StatelessWidget {
  const MainTextField(
      {super.key,
      required controller,
      this.width,
      this.height,
      this.label,
      this.onChange,
      this.validator,
      this.obscure,
      this.suffixTap,
      this.keyboardType,
      this.prifex,
      this.onPrifexTap})
      : _controller = controller;

  final _controller;
  final width;
  final height;
  final label;
  final onChange;
  final validator;
  final keyboardType;
  final obscure;
  final suffixTap;
  final prifex;
  final onPrifexTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 410.w,
      // height: 70.h,
      child: TextFormField(
        obscureText: obscure != null ? !obscure : false,
        keyboardType: keyboardType ?? TextInputType.text,
        style: TextStyle(fontSize: 25.sp),
        controller: _controller,
        textAlign: TextAlign.center,
        validator: validator,
        decoration: InputDecoration(
            contentPadding: obscure != null
                ? EdgeInsets.only(left: 100.w, bottom: 40.h).w
                : const EdgeInsets.symmetric(vertical: 15),
            suffixIcon: obscure != null
                ? GestureDetector(
                    onTap: suffixTap,
                    child: Icon(
                      obscure ? Icons.visibility : Icons.visibility_off,
                      size: 38.sp,
                      color: AppColors.grey,
                    ).pOnly(right: 25.w),
                  )
                : null,
            prefix: prifex != null
                ? GestureDetector(
                    onTap: () async {
                      final country = await showCountryPickerDialog(
                        context,
                      );
                      if (country != null) {
                        print(country.callingCode);
                      }
                    },
                    child: CountryPicker(),
                  )
                : null,
            hintText: label,
            hintStyle: TextStyle(
                color: AppColors.grey,
                fontFamily: AppFontsFamily.alixadnria,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: AppColors.primary,
                ))),
      ),
    );
  }
}
