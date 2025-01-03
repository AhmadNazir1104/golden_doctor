import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/widgets/universaL_widget/product_widget.dart';

class ProductCaruselWidget extends StatelessWidget {
  final String productCaruselName;
  final String productCaruselList;
  const ProductCaruselWidget(
      {super.key,
      required this.productCaruselName,
      required this.productCaruselList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 36.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productCaruselName,
                  style: AppTextStyles.headline2,
                ),
                Text(
                  "See All",
                  style: AppTextStyles.headline2.copyWith(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 305,
            child: ListView.builder(
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: AppConstant.brandList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ProductWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
