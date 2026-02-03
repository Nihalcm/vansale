import 'dart:ui';

class QuickLinkModel {
  final String image;
  final String name;
  final VoidCallback ontap;
  const QuickLinkModel({
    required this.image,
    required this.name,
    required this.ontap,
  });
}
