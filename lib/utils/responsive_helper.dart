import 'package:flutter/widgets.dart';

class ResponsiveHelper {
  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 1100;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint &&
          MediaQuery.of(context).size.width < desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

  static Size designSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= desktopBreakpoint) return const Size(1920, 1080);
    if (width >= tabletBreakpoint) return const Size(800, 1280);
    return const Size(430, 932);
  }
}
