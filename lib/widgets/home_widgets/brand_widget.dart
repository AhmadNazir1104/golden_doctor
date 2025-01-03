import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';

class BrandWidget extends StatelessWidget {
  final String imageVal;
  const BrandWidget({
    super.key,
    required this.imageVal,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.only(bottom: 36.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 12.h),
            child: Text(
              'Popular Brands',
              style: AppTextStyles.headline2,
            ),
          ),
          SizedBox(
            height: 65.h,
            child: ListView.builder(
              itemCount: AppConstant.brandList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    height: 65.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppConstant.brandList[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
