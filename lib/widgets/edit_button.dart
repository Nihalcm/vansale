import 'package:flutter/material.dart';
import 'package:vansales/utils/app_colours.dart';
import 'package:vansales/utils/app_text_styles.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            // SvgPicture.string(CommonSvg.edit),
            SizedBox(width: 5),
            Text("Edit", style: AppTextStyles.textButton),
          ],
        ),
      ),
    );
  }
}
