import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vansales/utils/app_colours.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 70.h,
              height: 70.h,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadiusGeometry.circular(100),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/images/shop.png",
                    color: AppColors.iconColor,
                    height: 40,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pick mini mart",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "+971 526536598",
                      style: TextStyle(
                        color: AppColors.iconColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Al-Qusais,Dubai",
                      style: TextStyle(
                        color: AppColors.iconColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            PopupMenuButton<int>(
              color: AppColors.white,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onSelected: (value) {},
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  height: 35,
                  child: Text("Call Shop", style: TextStyle(fontSize: 14)),
                ),
                PopupMenuItem(
                  value: 1,
                  height: 35,
                  child: Text("Edit Branch", style: TextStyle(fontSize: 14)),
                ),
              ],
              position: PopupMenuPosition.under,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: const Icon(Icons.more_vert, size: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
