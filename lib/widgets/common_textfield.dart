import 'package:vansales/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vansales/utils/app_colours.dart';

class CommonTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final int? maxDigitLength;
  final bool isPhone;
  final bool isCapital;
  final bool isPassword;
  final bool isVisible;
  final bool isNoEnabled;
  final bool? isTextLabel;
  final String? textLabel;
  final VoidCallback? onTap;
  final VoidCallback? onView;
  final TextInputType? textType;
  final Function(String)? onChanged;
  final int? maxLines;
  final int? minLines;
  final String? type; // "email", "phone", "password", "text"
  final bool optional;

  const CommonTextField({
    super.key,
    required this.title,
    this.controller,
    this.maxDigitLength,
    this.isPhone = false,
    this.isCapital = false,
    this.isPassword = false,
    this.isVisible = false,
    this.isNoEnabled = true,
    this.isTextLabel = false,
    this.textLabel,
    this.onTap,
    this.onView,
    this.textType = TextInputType.text,
    this.onChanged,
    this.maxLines,
    this.minLines = 1,
    this.type,
    this.optional = false,
  });

  List<TextInputFormatter>? _buildInputFormatters() {
    final List<TextInputFormatter> formatters = [];

    if (isCapital) formatters.add(UpperCaseTextInputFormatter());
    if (isPhone) formatters.add(FilteringTextInputFormatter.digitsOnly);
    if (maxDigitLength != null) {
      formatters.add(LengthLimitingTextInputFormatter(maxDigitLength));
    }

    return formatters.isEmpty ? null : formatters;
  }

  String? Function(String?)? _getValidator() {
    return (value) {
      switch (type) {
        case "email":
          return Validators.validateEmail(value, optional: optional);
        case "mobile":
          return Validators.validatePhone(value, optional: optional);
        case "password":
          return Validators.validatePassword(value, optional: optional);
        default:
          return Validators.validateEmpty(value, optional: optional);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isTextLabel == true)
          Row(
            children: [
              Text(
                textLabel ?? "",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1C1B1F),
                ),
              ),
              SizedBox(width: 2),
              optional == true
                  ? Text(
                      "(Optional)",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w100,
                        color: AppColors.iconColor,
                      ),
                    )
                  : SizedBox(),
              const Spacer(),
            ],
          ),
        if (isTextLabel == true) const SizedBox(height: 6),
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: isNoEnabled == false ? onTap : null,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TextFormField(
                controller: controller,
                enabled: isNoEnabled,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: (maxLines != null && maxLines! > 1)
                    ? TextInputType.multiline
                    : textType,
                textInputAction: (maxLines != null && maxLines! > 1)
                    ? TextInputAction.newline
                    : TextInputAction.next,
                obscureText: isPassword && !isVisible,
                maxLines: maxLines ?? 1,
                minLines: minLines ?? 1,
                textCapitalization: type == "email"
                    ? TextCapitalization.none
                    : TextCapitalization.sentences,
                cursorColor: Colors.black,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
                inputFormatters: _buildInputFormatters(),
                onChanged: onChanged,
                validator: _getValidator(),
                decoration: InputDecoration(
                  prefixIcon: isPhone
                      ? Padding(
                          padding: const EdgeInsets.only(left: 15, right: 4),
                          child: Text("+971"),
                        )
                      : null,
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                  hintText: title,
                  hintStyle: TextStyle(
                    color: const Color(0xFF8390A1),
                    fontSize: 15.sp,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  enabledBorder: _border(),
                  focusedBorder: _border(color: AppColors.iconColor),
                  disabledBorder: _border(),
                  errorBorder: _border(),
                  focusedErrorBorder: _border(),
                  suffixIcon: isPassword
                      ? InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: onView,
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Image.asset(
                              isVisible
                                  ? "assets/commonIcons/show.png"
                                  : "assets/commonIcons/hide.png",
                              height: 5,
                              color: AppColors.iconColor,
                            ),
                          ),
                        )
                      : !isNoEnabled
                      ? Icon(Icons.keyboard_arrow_down_rounded)
                      : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border({Color color = const Color(0xFFE8ECF4)}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }
}

class UpperCaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
