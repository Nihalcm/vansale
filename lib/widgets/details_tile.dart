import 'package:vansales/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vansales/utils/app_colours.dart';
import 'package:vansales/utils/app_text_styles.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    super.key,
    required this.subject,
    required this.details,
    this.isYellow,
    this.isHeading = false,
  });
  final String subject;
  final String details;
  final bool? isYellow;
  final bool? isHeading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Text(
            subject,
            style: isHeading == true
                ? AppTextStyles.subHeading
                : TextStyle(
                    color: const Color(0xFF1C1B1F),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: AppColors.borderColor, blurRadius: 2),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                details,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: FontFam.regular,
                  color: isYellow == true ? AppColors.yellow : AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
