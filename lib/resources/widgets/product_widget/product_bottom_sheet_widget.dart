import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/resources/widgets/product_widget/color_palette_widget.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_button.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/selectable_textbox.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';

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
    List col = [
      "black",
      "red",
      "green",
      "orange",
      "yello",
      "black",
      "red",
      "green",
      "orange",
      "yello",
    ];

    List fittype = [
      "Regular",
      "Petite",
    ];
    // var color = "black";
    // var code = list.firstWhereOrNull((e){
    //   return e["title"] == color;
    // });
    return
        // code== null?
        // Text(color):
        SingleChildScrollView(
      child: Container(
        // height: 639.h,
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
            spacing: 10.h,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40.w,
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
              Text(
                "SELECT COLOR ",
                style: AppTextStyles.headline3.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Wrap(
                children: [
                  ...col.map(
                    (e) => ColorPaletteWidget(
                      colorName: e,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SIZE",
                    style: AppTextStyles.headline3.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Size Chart",
                    style: AppTextStyles.lable2.copyWith(
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              Wrap(
                children: [
                  ...AppConstant.sizesList.map(
                    (e) => SelectableTextBox(
                      text: e,
                      isSelected: e == "XXL" ? true : false,
                      maxWidth: 50.w,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "SIZE TYPE  ",
                    style: AppTextStyles.headline3.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text("Regular", style: AppTextStyles.lable3),
                ],
              ),
              SizedBox(
                height: 29,
                child: ListView.builder(
                  itemCount: fittype.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SelectableTextBox(
                      text: fittype[index],
                      isSelected: index == 0 ? true : false,
                    );
                  },
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.only(top: 21.h, bottom: 5.h),
              //   child: Text(
              //     "Select Color",
              //     style: AppTextStyles.headline1.copyWith(fontSize: 17.sp),
              //   ),
              // ),
              // SizedBox(
              //   height: 40.h,
              //   child: ListView.builder(
              //     itemCount: AppConstant.colorList.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (BuildContext context, int index) {
              //       return ColorPaletteWidget(
              //         colorName: AppConstant.colorList[index],
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 21.h, bottom: 5.h),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "size",
              //         style: AppTextStyles.headline1.copyWith(fontSize: 17.sp),
              //       ),
              //       InkWell(
              //         onTap: () {},
              //         child: Text(
              //           "Size Chart",
              //           style: AppTextStyles.headline1.copyWith(
              //             fontSize: 17.sp,
              //             color: AppColors.grey70,
              //             fontWeight: FontWeight.w600,
              //             decoration: TextDecoration.underline,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizeCardWidget(),
              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(right: 7.w),
              //       child: Text(
              //         "size type",
              //         style: AppTextStyles.headline1.copyWith(
              //           fontSize: 17.sp,
              //           color: AppColors.black28,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ),
              //     Text(
              //       "Regular",
              //       style: AppTextStyles.body1.copyWith(
              //         fontSize: 15.sp,
              //         color: AppColors.grey70,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //   ],
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: 11.h),
              //   child: Row(
              //     children: [
              //       Container(
              //         height: 38.h,
              //         width: 70.w,
              //         margin: EdgeInsets.only(right: 11.w),
              //         decoration: BoxDecoration(
              //           color: AppColors.myPrimary,
              //           borderRadius: BorderRadius.circular(4.r),
              //         ),
              //         child: Center(
              //           child: Text(
              //             "Regular",
              //             style: AppTextStyles.headline1.copyWith(
              //               fontSize: 12.sp,
              //               color: AppColors.myScaffold,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 38.h,
              //         width: 70.w,
              //         margin: EdgeInsets.only(right: 11.w),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(4.r),
              //           border: Border.all(
              //             color: AppColors.greyCA,
              //           ),
              //         ),
              //         child: Center(
              //           child: Text(
              //             "Regular",
              //             style: AppTextStyles.headline1.copyWith(
              //               fontSize: 12.sp,
              //               color: AppColors.myPrimary,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              AppButtons.myprimaryButton(
                onPressed: () {},
                text: 'ADD TO BAG',
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
