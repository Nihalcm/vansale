// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:vansales/utils/app_colours.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick {
  static Future<XFile?> pickImage(BuildContext context) async {
    return _pickAndCrop(context, ImageSource.gallery);
  }

  static Future<XFile?> _pickAndCrop(
    BuildContext context,
    ImageSource source,
  ) async {
    final picker = ImagePicker();
    final XFile? picked = await picker.pickImage(source: source);

    if (picked == null) return null;

    if (kIsWeb) {
      return picked;
    }

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    final CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: picked.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          hideBottomControls: true,
          lockAspectRatio: true,
          toolbarColor: AppColors.white,
          statusBarColor: AppColors.white,
          toolbarWidgetColor: AppColors.black,
          aspectRatioPresets: [CropAspectRatioPreset.square],
        ),
        WebUiSettings(context: context),
      ],
    );

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    if (cropped == null) return null;
    return XFile(cropped.path);
  }
}
