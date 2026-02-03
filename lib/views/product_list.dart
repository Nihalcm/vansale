import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vansales/utils/app_colours.dart';
import 'package:vansales/utils/app_fonts.dart';
import 'package:vansales/widgets/common_appbar.dart';
import 'package:vansales/widgets/common_textfield.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});
  final List<String> category = [
    "Cakes",
    "Donuts",
    "Croissant",
    "Biscuits",
    "Muffins",
    "Hot Drinks",
    "Cold Drinks",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: customAppBar(title: "Products"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                shrinkWrap: true,
                itemCount: category.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.primary.withAlpha(100),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        category[index],
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CommonTextField(title: "Search here.."),
            ),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50.h,
                            width: 200.w,
                            decoration: BoxDecoration(
                              color: AppColors.borderColor,
                              border: Border.all(color: AppColors.borderColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "#0001",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                  fontFamily: FontFam.medium,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chocolate Donut",
                              style: TextStyle(color: AppColors.iconColor),
                            ),
                            Text(
                              "3.5 AED",
                              style: TextStyle(
                                color: AppColors.black,
                                fontFamily: FontFam.bold,
                              ),
                            ),
                            Text(
                              "Stock : 87",
                              style: TextStyle(
                                color: AppColors.black,
                                fontFamily: FontFam.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          // Wrap with InkWell for tap interaction
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => AddProductSheet(
                                productName: "Chocolate Donut",
                                stock: "879",
                                price: "3.5 AED",
                              ),
                            );
                          },
                          child: Container(
                            height: 40.h,
                            width: 200.w,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              border: Border.all(color: AppColors.borderColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "ADD",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.white,
                                  fontFamily: FontFam.medium,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AddProductSheet extends StatefulWidget {
  final String productName;
  final String price;
  final String stock;

  const AddProductSheet({
    super.key,
    required this.productName,
    required this.price,
    required this.stock,
  });

  @override
  State<AddProductSheet> createState() => _AddProductSheetState();
}

class _AddProductSheetState extends State<AddProductSheet> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            widget.productName,
            style: TextStyle(
              fontSize: 20.sp,
              fontFamily: FontFam.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            widget.price,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: FontFam.medium,
              color: AppColors.primary,
            ),
          ),
          Text(
            "Stock: ${widget.stock}",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: FontFam.medium,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quantity",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: FontFam.medium,
                  color: AppColors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      icon: Icon(Icons.remove, size: 20),
                      color: AppColors.iconColor,
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: Icon(Icons.add, size: 20),
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Implement assignment logic here
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Added $quantity to Order")),
                );
              },
              child: Text(
                "Confirm",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.white,
                  fontFamily: FontFam.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
