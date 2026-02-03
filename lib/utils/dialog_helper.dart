import 'package:vansales/widgets/common_alert_box.dart';
import 'package:vansales/widgets/error_alert_box.dart';
import 'package:vansales/widgets/success.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DialogHelper {
  static void showError({
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    // Close keyboard
    FocusManager.instance.primaryFocus?.unfocus();

    Get.dialog(
      ErrorAlertBox(
        message: message,
        confirmText: title,
      ),

      barrierDismissible: false,
    );
  }
  static void successPopUp({
    required String title,
    required String message,
    String buttonText = 'OK',
    VoidCallback? onPressed,
  }) {
    // Close keyboard
    FocusManager.instance.primaryFocus?.unfocus();

    Get.dialog(
      Success(
        onPressed: onPressed??(){},
        message: message,
        confirmText: title,
      ),

      barrierDismissible: false,
    );
  }
  static void showCustomDialog({
    required String message,
    required String confirmText,
    VoidCallback? onConfirm,
    String? cancelText,
    VoidCallback? onCancel,
  }) {
    Get.dialog(
      CustomAlertDialog(
        message: message,
        confirmText: confirmText,
        onConfirm: onConfirm ?? () {},
        cancelText: cancelText,
        onCancel: onCancel,
      ),
      barrierDismissible: true,
    );
  }
}
