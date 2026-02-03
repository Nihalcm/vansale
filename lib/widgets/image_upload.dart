import 'dart:io';

import 'package:vansales/utils/app_colours.dart';
import 'package:vansales/widgets/image_pick.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImageUpload extends StatelessWidget {
  final Rx<XFile?> pickedImage;
  final void Function(XFile file) onImagePicked;
  final double? height;
  final double? width;
  final String? imageUrl;
  const ImageUpload({
    super.key,
    required this.pickedImage,
    required this.onImagePicked,
    this.imageUrl,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final imageFile = pickedImage.value;

      return Center(
        child: GestureDetector(
          onTap: () async {
            final picked =
            await ImagePick.pickImage(context);

            if (picked != null) {
              onImagePicked(picked);
            }
          },
          child: Container(
            height: height ?? 100,
            width: width ?? 100,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: AppColors.borderColor),
              image: imageFile != null
                  ? DecorationImage(
                      image: kIsWeb
                          ? NetworkImage(imageFile.path)
                          : FileImage(File(imageFile.path)) as ImageProvider,
                    )
                  : (imageUrl != null && imageUrl!.isNotEmpty)
                  ? DecorationImage(image: NetworkImage(imageUrl!))
                  : null,
            ),
            child: (imageFile == null &&
                (imageUrl == null || imageUrl!.isEmpty))
                ?  Icon(Icons.image_outlined, size: 40.w,color: AppColors.iconColor,)
                : null,
          ),
        ),
      );
    });
  }
}