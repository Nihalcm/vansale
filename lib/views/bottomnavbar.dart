import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vansales/utils/app_colours.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      height: 90.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(color: AppColors.borderColor, blurRadius: 2)],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem("assets/images/home.svg", "Home", 0),
            _buildNavItem("assets/images/user.svg", "Profile", 1),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon, name, int index) {
    final isActive = index == currentIndex;
    return InkWell(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: Column(
          children: [
            SvgPicture.asset(
              height: 35.h,
              icon,
              color: isActive ? AppColors.primary : AppColors.iconColor,
            ),
            SizedBox(height: 5),
            Text(
              name,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: isActive ? AppColors.primary : AppColors.iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
