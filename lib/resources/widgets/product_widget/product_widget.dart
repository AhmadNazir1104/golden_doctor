import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/models/products/product_model.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';
import 'package:golden_doctor/resources/widgets/product_widget/product_bottom_sheet_widget.dart';

class ProductWidget extends StatelessWidget {
  final ProductNode singleProduct;
  const ProductWidget({
    super.key,
    required this.singleProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145.w,
      height: 395,
      // margin: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
          // border: Border.all(
          // color: AppColors.black1C.withOpacity(0.5),
          // width: 0.5,
          // ),
          ),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(5),
                ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // ----Image---
                Container(
                  width: double.infinity,
                  // height: 202.h,
                  decoration: BoxDecoration(
                    color: AppColors.greyCA,
                  ),
                  child: AspectRatio(
                    aspectRatio: 6 / 7,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: singleProduct.variants.edges[0].node.image.url,
                      // 'https://pixlr.com/images/generator/photo-generator.webp',
                      // height: 200.h,
                      placeholder: (context, url) => SizedBox(
                        width: double.infinity,
                        height: 202.h,
                        child: Center(
                          child: Image(
                            image: AssetImage(
                              AppImages.doctorImage,
                            ),
                            width: double.infinity,
                            height: 202.h,
                            opacity: AlwaysStoppedAnimation(0.3),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                // ----button----
                Positioned(
                  bottom: 10,
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Center(
                      child: FloatingActionButton(
                        heroTag: "pl",
                        backgroundColor: AppColors.myScaffold,
                        elevation: 0,
                        isExtended: false,
                        mini: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.add,
                          color: AppColors.myPrimary,
                          size: 12.h,
                          weight: 700,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            clipBehavior: Clip.antiAlias,
                            builder: (context) => ProductBottomSheetWidget(),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  // BorderRadius.only(
                                  //   topLeft: Radius.circular(0),
                                  //   topRight: Radius.circular(20),
                                  // ),

                                  BorderRadius.vertical(
                                      top: Radius.circular(16)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                // ---- sales tag----
                // Visibility(
                //   visible: true,
                //   child: Positioned(
                //     top: 0,
                //     right: 0,
                //     child: Container(
                //       color: AppColors.grey,
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                //       child: Text('%',
                //           style: AppTextStyles.body1
                //               ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  singleProduct.title,
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
                  style: AppTextStyles.headline2.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    //  SizedBox(
    //   // color: AppColors.black1C,
    //   width: 159.w,
    //   child: Padding(
    //     padding: EdgeInsets.only(left: 12.w),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Container(
    //           height: 192.h,
    //           width: 159.w,
    //           decoration: BoxDecoration(
    //             color: AppColors.greyCA,
    //             borderRadius: BorderRadius.circular(4.r),
    //             image: DecorationImage(
    //               fit: BoxFit.cover,
    //               image: AssetImage(
    //                 AppImages.women1Image,
    //               ),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           width: 57.w,
    //           height: 31.h,
    //           margin: EdgeInsets.only(top: 7.h, bottom: 12.h),
    //           decoration: BoxDecoration(
    //             color: AppColors.greyCA,
    //             borderRadius: BorderRadius.circular(70.r),
    //           ),
    //           child: Center(
    //             child: Text(
    //               'Infinity',
    //               style: AppTextStyles.body2,
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           width: 100.w,
    //           child: Text(
    //             "Infinity Women's Split Neck Top…",
    //             style: AppTextStyles.body2.copyWith(fontSize: 12.sp),
    //           ),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(top: 10.h),
    //           child: Row(
    //             children: [
    //               Text(
    //                 "Color Name",
    //                 style: AppTextStyles.body2.copyWith(fontSize: 12.sp),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(left: 5.w),
    //                 // width: 125.w,
    //                 child: Text(
    //                   "06 Colors",
    //                   style: AppTextStyles.body3.copyWith(fontSize: 12.sp),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(top: 5.h),
    //           // width: 125.w,
    //           child: Text(
    //             "SAR 350",
    //             style: AppTextStyles.headline2.copyWith(
    //               fontSize: 17.sp,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
