import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vansales/utils/app_colours.dart';
import 'package:get/get.dart';

AppBar customAppBar({required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    ),
    leading: SizedBox(
      width: 60.w, // Adjust width as needed
      child: Row(
        children: [
          SizedBox(width: 10.w),
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
        ],
      ),
    ),
    centerTitle: true,
    toolbarHeight: 100.h,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    actions: [
      // SvgPicture.string(HomeSvgs.notification, height: 54.h),
      SizedBox(width: 16.w),
    ],
  );
}
