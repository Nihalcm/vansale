import 'package:vansales/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'utils/app_colours.dart';
import 'utils/responsive_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  ScreenUtil.ensureScreenSize();

  final type = Uri.base.queryParameters['type'];
  final couponCode = Uri.base.queryParameters['coupon'];

  runApp(MyApp(type: type, couponCode: couponCode));
}

class MyApp extends StatelessWidget {
  final String? type;
  final String? couponCode;
  const MyApp({super.key, this.type, this.couponCode});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ResponsiveHelper.designSize(context),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.primary,
                selectionColor: AppColors.primary.withAlpha(80),
                selectionHandleColor: AppColors.primary,
              ),
              fontFamily: 'Roboto',
            ),
            home: Dashboard()
        );
      },
    );
  }
}
