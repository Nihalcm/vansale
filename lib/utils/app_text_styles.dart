
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vansales/utils/app_colours.dart';

class AppTextStyles {
  static TextStyle get heading => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle get subHeading => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle get smallText => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle get title => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle get subTitle => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.iconColor,
  );

  static TextStyle get normalTitle => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle get textButton => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle get button => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle get cancelButton => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static TextStyle get loginButton => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
