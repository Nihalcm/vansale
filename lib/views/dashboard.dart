// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vansales/controller/connectivity_controller.dart';
import 'package:vansales/controller/dash_controller.dart';
import 'package:vansales/utils/app_colours.dart';
import 'package:vansales/utils/app_fonts.dart';
import 'package:vansales/views/bottomnavbar.dart';
import 'package:vansales/views/home_page.dart';
import 'package:vansales/views/no_internet.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final controller = Get.put(BottomNavController());
  final connectionController = Get.put(InternetConnectionController());
  final List<Widget> _pages = [HomePage(), Text("awiufghej;piok")];
  DateTime? lastBackPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: false,

        onPopInvoked: (didPop) {
          if (didPop) return;
          if (controller.currentIndex.value != 0) {
            controller.changeTab(0);
            return;
          }
          DateTime now = DateTime.now();
          if (lastBackPressed == null ||
              now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
            lastBackPressed = now;
            Get.snackbar(
              "Exit App",
              "Press back again to exit",
              snackPosition: SnackPosition.BOTTOM,
              animationDuration: Duration(milliseconds: 500),
              duration: const Duration(seconds: 2),
            );
          } else {
            SystemNavigator.pop();
          }
        },
        child: connectionController.isConnected.value == false
            ? NoInternetScreen()
            : Scaffold(
                appBar: AppBar(
                  surfaceTintColor: AppColors.white,
                  backgroundColor: AppColors.white,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 70.h,
                  title: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/cube.svg",
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Van Business",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.primary,
                          fontFamily: FontFam.medium,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    CircleAvatar(
                      backgroundColor: AppColors.borderColor.withAlpha(200),
                      radius: 25.h,
                      child: SvgPicture.asset(
                        "assets/images/user.svg",
                        color: AppColors.secondary,
                      ),
                    ),
                    SizedBox(width: 20.h),
                  ],
                ),
                backgroundColor: AppColors.background,
                body: _pages[controller.currentIndex.value],
                bottomNavigationBar: SafeArea(
                  child: BottomNavBar(
                    currentIndex: controller.currentIndex.value,
                    onTap: controller.changeTab,
                  ),
                ),
              ),
      ),
    );
  }
}
