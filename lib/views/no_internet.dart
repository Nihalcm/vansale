import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vansales/controller/connectivity_controller.dart';
import 'package:vansales/utils/app_colours.dart';
import 'package:vansales/utils/app_text_styles.dart';
import 'package:vansales/views/dashboard.dart';
import 'package:vansales/widgets/common_button.dart';

class NoInternetScreen extends StatelessWidget {
  NoInternetScreen({super.key});
  final connectionController = Get.put(InternetConnectionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (connectionController.isConnected.value) {
        // Automatically go to dashboard when internet is back
        Future.microtask(() => Get.offAll(Dashboard()));
      }

      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/nointernet.png",
                color: AppColors.primary,
                height: 150.h,
              ),
              Text("You’re Offline", style: AppTextStyles.title),
              Text(
                "Check your internet connection and try again.",
                style: AppTextStyles.subTitle,
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: CommonButton(
                  onTap: () async {
                    bool connected = await connectionController
                        .hasNetworkAccess();
                    connectionController.isConnected.value = connected;

                    if (!connected) {
                      Get.snackbar(
                        "No Internet",
                        "Still no connection. Please try again.",
                        colorText: AppColors.black,
                        backgroundColor: AppColors.borderColor,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  title: "Retry",
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
