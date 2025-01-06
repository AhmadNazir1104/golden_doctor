import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';

class CreateYourSetWidget extends StatelessWidget {
  final String setname;
  const CreateYourSetWidget({super.key, required this.setname});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 466.h,
      margin: EdgeInsets.only(bottom: 36.h),
      decoration: BoxDecoration(
        color: AppColors.greyF2,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey9c,
            ),
            height: 376.h,
            width: MediaQuery.of(context).size.width,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(
                AppImages.createSetImage,
              ),
            ),
          ),
          SizedBox(height: 19.h),
          Text(
            setname,
            style: AppTextStyles.headline2,
          ),
        ],
      ),
    );
  }
}
