import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/models/products/product_model.dart';
import 'package:golden_doctor/resources/widgets/product_widget/color_palette_widget.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_button.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/selectable_textbox.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';
import 'package:golden_doctor/view_models/product_details_view_model.dart';

// var list = [
//   {
//     "title": "black",
//     "code": "0xff2345f",
//   },
// ];

class ProductBottomSheetWidget extends ConsumerStatefulWidget {
  final ProductNode singleProduct;
  const ProductBottomSheetWidget({super.key, required this.singleProduct});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductBottomSheetWidgetState();
}

class _ProductBottomSheetWidgetState
    extends ConsumerState<ProductBottomSheetWidget> {
  final uniquePageKey = DateTime.now().toUtc().toString();
  @override
  void initState() {
    ref
        .read(productDetailsProvider(uniquePageKey).notifier)
        .productQuentity(context, widget.singleProduct.id);

    Future.delayed(Duration(seconds: 0)).then((value) {
      ref.read(productDetailsProvider(uniquePageKey).notifier).selectOption(
          widget.singleProduct.variants.edges[0].node.selectedOptions);
    });
    super.initState();
  }

// class ProductBottomSheetWidget extends StatelessWidget {
//   final ProductNode singleProduct;
//   const ProductBottomSheetWidget({super.key, required this.singleProduct});

  @override
  Widget build(BuildContext context) {
    // List col = [
    //   "black",
    //   "red",
    //   "green",
    //   "orange",
    //   "yello",
    //   "black",
    //   "red",
    //   "green",
    //   "orange",
    //   "yello",
    // ];

    // List fittype = [
    //   "Regular",
    //   "Petite",
    // ];
    // var color = "black";
    // var code = list.firstWhereOrNull((e){
    //   return e["title"] == color;
    // });
    final optionsWatch = ref.watch(productDetailsProvider(uniquePageKey));
    final optionsRead = ref.read(productDetailsProvider(uniquePageKey).notifier);

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
                          widget.singleProduct.variants.edges[0].node.image.url,
                      // 'https://pixlr.com/images/generator/photo-generator.webp',
                      // height: 200.h,
                      placeholder: (context, url) => SizedBox(
                        width: 92.w,
                        height: 141.h,
                        child: Center(
                          child: Image(
                            image: AssetImage(
                              AppImages.logoImage,
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
                          widget.singleProduct.vendor!,
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
                              // "Infinity Women's Split Neck Top W/Princess Seam",
                              widget.singleProduct.title,
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
                              // "\$33.00"
                              "\$${widget.singleProduct.variants.edges[0].node.price.amount}",
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

              SizedBox(
                // height: 30,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.singleProduct.options.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  itemBuilder: (context, index) {
                    Options singlePro = widget.singleProduct.options[index];

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        singlePro.name == 'Color'
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "SELECT COLOR ",
                                    singlePro.name,
                                    style: AppTextStyles.headline3.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Wrap(
                                    children: [
                                      ...singlePro.optionValues.map(
                                        (e) => ColorPalateWidget(
                                          optionKey: singlePro.name,
                                          optionValue: e.name,
                                          uniquePageKey: uniquePageKey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : singlePro.name == 'Fit'
                                ? Padding(
                                    padding: EdgeInsets.only(top: 29.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              // "SIZE TYPE  ",
                                              singlePro.name.toUpperCase(),
                                              style: AppTextStyles.headline3
                                                  .copyWith(
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(width: 15.w),
                                            Text("Regular",
                                                style: AppTextStyles.lable3),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h),
                                          child: SizedBox(
                                            height: 29,
                                            child: ListView.builder(
                                              itemCount:
                                                  singlePro.optionValues.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                OptionValuesModel singleOp =
                                                    singlePro
                                                        .optionValues[index];
                                                return GestureDetector(
                                                  onTap: () {
                                                    var temp = optionsWatch;
                                                    temp[temp.indexWhere((e) =>
                                                            e.name ==
                                                            singlePro.name)] =
                                                        SelectedOption(
                                                      name: singlePro.name,
                                                      value: singleOp.name,
                                                    );

                                                    optionsRead
                                                        .selectOption(temp);
                                                  },
                                                  child: SelectableTextBox(
                                                    text: singleOp.name,
                                                    isSelected: singleOp.name ==
                                                            optionsWatch
                                                                .firstWhere((x) =>
                                                                    x.name ==
                                                                    singlePro
                                                                        .name)
                                                                .value
                                                        ? true
                                                        : false,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : singlePro.name == 'Size'
                                    ? Padding(
                                        padding: EdgeInsets.only(top: 29.h),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  // "SIZE",
                                                  singlePro.name,
                                                  style: AppTextStyles.headline3
                                                      .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  "Size Chart",
                                                  style: AppTextStyles.lable2
                                                      .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 10.h),
                                              child: Wrap(
                                                children: [
                                                  ...
                                                  // AppConstant.sizesList

                                                  singlePro.optionValues.map(
                                                    (e) => GestureDetector(
                                                      onTap: () {
                                                        var temp = optionsWatch;
                                                        temp[temp.indexWhere(
                                                                (e) =>
                                                                    e.name ==
                                                                    singlePro
                                                                        .name)] =
                                                            SelectedOption(
                                                          name: singlePro.name,
                                                          value: e.name,
                                                        );

                                                        optionsRead
                                                            .selectOption(temp);
                                                      },
                                                      child: SelectableTextBox(
                                                        text: e.name,
                                                        isSelected: e.name ==
                                                                optionsWatch
                                                                    .firstWhere((x) =>
                                                                        x.name ==
                                                                        singlePro
                                                                            .name)
                                                                    .value
                                                            ? true
                                                            : false,
                                                        // e.name
                                                        //  == "XXL"
                                                        //     ? true
                                                        // :
                                                        // false,
                                                        maxWidth: 50.w,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                      ],
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
