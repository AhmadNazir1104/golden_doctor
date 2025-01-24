import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';

class CartCardWidget extends StatelessWidget {
  const CartCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(
              AppImages.doctorImage,
            ),
            height: 160.h,
            width: 113.w,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: AppConstant.selectedLanguage == 'EN'
                ? EdgeInsets.only(left: 15.w)
                : EdgeInsets.only(right: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Smile T-shirt',
                  style: AppTextStyles.body1.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text(
                    'Infinit',
                    style: AppTextStyles.body1
                        .copyWith(fontSize: 16.sp, color: AppColors.grey70),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'SAR 350',
                      style: AppTextStyles.body1.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 5.w),
                      child: Text(
                        '565',
                        style: AppTextStyles.body1
                            .copyWith(fontSize: 16.sp, color: AppColors.grey70),
                      ),
                    ),
                    Text(
                      '-66%',
                      style: AppTextStyles.body1
                          .copyWith(fontSize: 16.sp, color: AppColors.redFB71),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    Container(
                      // width: 100.w,
                      decoration: BoxDecoration(
                        color: AppColors.greyDE,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.remove,
                              color: AppColors.grey70,
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     Icons.remove,
                          //     color: AppColors.grey70,
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text('2'),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.add,
                              color: AppColors.grey70,
                            ),
                          )
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(
                          //     Icons.add,
                          //     color: AppColors.grey70,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.w),
                      child: Text(
                        'Size: L',
                        style: AppTextStyles.body1.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
            ),
          ),
        ],
      ),
    );
  }
}
