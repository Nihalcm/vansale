import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vansales/utils/app_colours.dart';
import 'package:vansales/utils/app_text_styles.dart';


class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final bool? isLoading;
  final bool isLogin;
  final bool cancel;
  final bool isIcon;
  final bool isSmallButton;
  final bool isChatIcon;
  const CommonButton({
    super.key,
    this.onTap,
    this.isSmallButton = false,
    this.title,
    this.isLoading,
    this.isLogin = false,
    this.isChatIcon = false,
    this.isIcon = false,
    this.cancel = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.white54),
      focusColor: Colors.white,
      hoverColor: Colors.white,
      splashColor: Colors.white,
      onTap: isLoading==true?null:onTap,
      child: Container(
        // width: 382.w,
        height: isLogin
            ? 62.h
            : isSmallButton
            ? 50.h
            : 59.h,
        decoration: cancel
            ? BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(15.sp),
              )
            : ShapeDecoration(
                color:isLoading==true? AppColors.iconColor:AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(isLogin ? 24.sp : 15.sp),
                ),
              ),
        alignment: Alignment.center,
        child: isLoading == true
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: Colors.white,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // isChatIcon
                  //     ? SvgPicture.string(ContactUsSvgs.chat,color: cancel?AppColors.primary:AppColors.white,)
                  //     : SizedBox(),
                  isChatIcon ? SizedBox(width: 2) : SizedBox(),
                  Text(
                    title ?? "",
                    textAlign: TextAlign.center,
                    style: isLogin
                        ? AppTextStyles.loginButton
                        : cancel
                        ? AppTextStyles.cancelButton
                        : isSmallButton
                        ? TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )
                        : AppTextStyles.button,
                  ),
                  isIcon ? SizedBox(width: 5) : SizedBox(),
                  isIcon
                      ? Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.white,
                          size: 20.sp,
                        )
                      : SizedBox(),
                ],
              ),
      ),
    );
  }
}
