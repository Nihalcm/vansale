import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vansales/utils/app_text_styles.dart';


class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100.h),
          // SvgPicture.string(CommonSvg.empty),
          SizedBox(height: 20),
          Text(title, style: AppTextStyles.title),
          SizedBox(height: 10,),
          Text(subTitle, style: AppTextStyles.subTitle,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
