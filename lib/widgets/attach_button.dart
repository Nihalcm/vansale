import 'package:vansales/utils/app_colours.dart';
import 'package:flutter/material.dart';


// update path

class AttachSection extends StatelessWidget {
  const AttachSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),

        Row(
          children: [
            AttachButton(
              label: "Images",
              icon: Icons.insert_photo,
              onTap: () {},
            ),
            const SizedBox(width: 10),
            AttachButton(
              label: "PDF",
              icon: Icons.picture_as_pdf_outlined,
              onTap: () {},
            ),

          ],
        ),
      ],
    );
  }
}

//==================================

class AttachButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const AttachButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          spacing: 8,
          children: [
            Icon(icon, size: 16, color: AppColors.black),
            Text(
              label,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
