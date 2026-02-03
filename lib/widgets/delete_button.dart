import 'package:flutter/material.dart';
import 'package:vansales/utils/app_colours.dart';
import 'package:vansales/utils/app_text_styles.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.string(CommonSvg.delete),
              SizedBox(width: 5),
              Text("Delete", style: AppTextStyles.textButton),
            ],
          ),
        ),
      ),
    );
  }
}
