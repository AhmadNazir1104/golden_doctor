import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';
// import 'package:collection/collection.dart';

var list = [
  {
    "title": "black",
    "code": "0xff2345f",
  },
];

class ProductBottomSheetWidget extends StatelessWidget {
  const ProductBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // var color = "black";
    // var code = list.firstWhereOrNull((e){
    //   return e["title"] == color;
    // });
    return 
    // code== null?
    // Text(color):
      Container(
      height: 639.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.myScaffold,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Quick Buy',
                  style: AppTextStyles.headline3,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 92.w,
                  height: 141.h,
                  decoration: BoxDecoration(
                    color: AppColors.greyCA,
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        'https://pixlr.com/images/generator/photo-generator.webp',
                    // height: 200.h,
                    placeholder: (context, url) => SizedBox(
                      width: 92.w,
                      height: 141.h,
                      child: Center(
                        child: Image(
                          image: AssetImage(
                            AppImages.doctorImage,
                          ),
                          width: 92.w,
                          height: 141.h,
                          opacity: AlwaysStoppedAnimation(0.3),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Infinity',
                        style: AppTextStyles.body1.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 21.h),
                        child: SizedBox(
                          width: 200.w,
                          child: Text(
                            "Infinity Women's Split Neck Top W/Princess Seam",
                            style: AppTextStyles.body1.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 21.h),
                        child: SizedBox(
                          width: 200.w,
                          child: Text(
                            "\$33.00",
                            style: AppTextStyles.body1.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 21.h),
              child: Text(
                "Select Color",
                style: AppTextStyles.headline1.copyWith(
                  fontSize: 17.sp,
                  // fontWeight: FontWeight.w700,
                  // color: AppColors.black28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
