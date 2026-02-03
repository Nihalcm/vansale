import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppDialogs {
  static Future<void> showSizedDialog({
    required Widget child,
    bool dismissible = true,
  }) async {
    return Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.all(70.w), // allows full control of size
        child: ClipRRect(borderRadius: BorderRadiusGeometry.circular(10),
          child: SizedBox(
            width: 1000.w,
            height: 1000.h,
            child: child,
          ),
        ),
      ),
      barrierDismissible: dismissible,
    );
  }
}
