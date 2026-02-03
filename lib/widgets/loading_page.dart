import 'package:vansales/utils/app_colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColors.white,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          spacing: 10.h,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(height: 1, color: AppColors.borderColor),
            SizedBox(height: 20.h),
            Row(
              children: [
                SizedBox(width: 20),
                buildShimmer(height: 20.h, width: 200.w),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                buildShimmer(height: 20.h, width: 300.w),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                buildShimmer(height: 100.h, width: 400.w),
              ],
            ),
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        buildShimmer(height: 180.h, width: 400.w, radius: 20.r),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/images/load.json',
                      height: 50.w,
                      fit: BoxFit.cover,
                    ),
                    Text("Loading.. "),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Center(
              child: buildShimmer(height: 40.h, width: 250.w),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10.h,
              children: [
                buildShimmer(height: 20.h, width: 200.w),
                buildShimmer(height: 40.h, width: 400.w),
                buildShimmer(height: 20.h, width: 200.w),
                buildShimmer(height: 40.h, width: 400.w),
                buildShimmer(height: 20.h, width: 200.w),
                buildShimmer(height: 40.h, width: 400.w),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShimmer({double? height, double? width, double? radius}) {
    return Shimmer.fromColors(
      baseColor: AppColors.secondary,
      highlightColor: AppColors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.borderColor,
          borderRadius: BorderRadius.circular(radius ?? 2.r),
        ),
      ),
    );
  }
}
