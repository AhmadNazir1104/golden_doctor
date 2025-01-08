import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';

class SizeCardWidget extends StatelessWidget {
  const SizeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 36.h, top: 10.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: 7.w,
          mainAxisSpacing: 0.h,
          childAspectRatio: 1,
        ),
        itemCount: AppConstant.sizesList.length,
        // scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left: 0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 38.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    border: Border.all(
                      color: AppColors.greyCA,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Center(
                    child: Text(
                      AppConstant.sizesList[index],
                      style: AppTextStyles.headline2,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
