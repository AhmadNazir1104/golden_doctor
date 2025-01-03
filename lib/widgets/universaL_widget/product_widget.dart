import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.black1C,
      width: 159.w,
      child: Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 192.h,
              width: 159.w,
              decoration: BoxDecoration(
                color: AppColors.greyCA,
                borderRadius: BorderRadius.circular(4.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImages.women1Image,
                  ),
                ),
              ),
            ),
            Container(
              width: 57.w,
              height: 31.h,
              margin: EdgeInsets.only(top: 7.h, bottom: 12.h),
              decoration: BoxDecoration(
                color: AppColors.greyCA,
                borderRadius: BorderRadius.circular(70.r),
              ),
              child: Center(
                child: Text(
                  'Infinity',
                  style: AppTextStyles.body2,
                ),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                "Infinity Women's Split Neck Top…",
                style: AppTextStyles.body2.copyWith(fontSize: 12.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                children: [
                  Text(
                    "Color Name",
                    style: AppTextStyles.body2.copyWith(fontSize: 12.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    // width: 125.w,
                    child: Text(
                      "06 Colors",
                      style: AppTextStyles.body3.copyWith(fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              // width: 125.w,
              child: Text(
                "SAR 350",
                style: AppTextStyles.headline2.copyWith(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
