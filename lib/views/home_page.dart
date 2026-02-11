import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vansales/model/quick_link_model.dart';
import 'package:vansales/utils/app_colours.dart';
import 'package:vansales/utils/app_fonts.dart';
import 'package:vansales/views/Store_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<QuickLinkModel> quickLinks = [
    QuickLinkModel(
      image: "assets/images/seller.svg",
      name: "Sell\nProduct",
      ontap: () {
        Get.to(StoreList());
      },
    ),
    QuickLinkModel(
      image: "assets/images/stock.svg",
      name: "Stock\nManagement",
      ontap: () {},
    ),
    QuickLinkModel(
      image: "assets/images/products.svg",
      name: "Product\nManagement",
      ontap: () {},
    ),
    QuickLinkModel(
      image: "assets/images/history.svg",
      name: "Sales\nHistory",
      ontap: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    "Dashboard",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 22.sp,
                      fontFamily: FontFam.extraBold,
                    ),
                  ),
                ],
              ),
              //------------------------------------------
              Container(
                width: double.infinity,
                height: 150.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 20,
                      top: 20,
                      child: SvgPicture.asset(
                        "assets/images/truck.svg",
                        color: AppColors.primaryLight,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total sales in this Month",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20.sp,
                              fontFamily: FontFam.thin,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "65,521",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 40.sp,
                                  fontFamily: FontFam.extraBold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //------------------------------------------
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Container(
                      height: 150.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 20,
                            top: 20,
                            child: SvgPicture.asset(
                              "assets/images/coinsup.svg",
                              color: AppColors.primary,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today\nsales",
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14.sp,
                                    fontFamily: FontFam.thin,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "6500",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 30.sp,
                                        fontFamily: FontFam.extraBold,
                                      ),
                                    ),
                                    Text(
                                      " AED",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 20.sp,
                                        fontFamily: FontFam.extraBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 20,
                            top: 20,
                            child: SvgPicture.asset(
                              "assets/images/coins.svg",
                              color: AppColors.primary,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Outstanding\npayments",
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14.sp,
                                    fontFamily: FontFam.thin,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "- 4500",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 30.sp,
                                        fontFamily: FontFam.extraBold,
                                      ),
                                    ),
                                    Text(
                                      " AED",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 20.sp,
                                        fontFamily: FontFam.extraBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 70.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                        "25",
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 18.sp,
                          fontFamily: FontFam.extraBold,
                        ),
                      ),
                      Text(
                        "  Items low in stock",
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 12.sp,
                          fontFamily: FontFam.regular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Quick Area",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 22.sp,
                      fontFamily: FontFam.extraBold,
                    ),
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: quickLinks.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return InkWell(onTap: quickLinks[index].ontap,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(quickLinks[index].image,color: AppColors.primary,height: 35.h,),
                          SizedBox(height: 10.h,),
                          Text(quickLinks[index].name,textAlign: TextAlign.center,style: GoogleFonts.poppins(color: AppColors.primary,fontSize: 12.sp),),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
