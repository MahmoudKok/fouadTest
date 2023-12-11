import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/src/theme/app_image.dart';

class UpImage extends StatelessWidget {
  const UpImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppImages.ali_fouad_logo,
        width: 480.w,
        height: 170.h,
      ),
    );
  }
}
