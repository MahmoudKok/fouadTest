import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryPicker extends StatelessWidget {
  CountryPicker({super.key});

  var country;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 20.w,
      height: 20.h,
      child: CountryPickerDropdown(
        initialValue: 'AE',
        itemBuilder: (Country country) {
          return Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
            ],
          );
        },
        onValuePicked: (Country country) {
          print(country.name);
        },
      ),
    );
  }
}
