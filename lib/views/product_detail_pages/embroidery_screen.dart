import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_button.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view_models/embroidery_view_model/embroidery_view_model.dart';

String defineText = 'Ahmad';

class EmbroideryScreen extends ConsumerWidget {
  const EmbroideryScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addTextProviderWatch = ref.watch(addTextBoolProvider);
    final textPositionPro = ref.watch(textPositionProvider);
    final textColorPro = ref.watch(textColorProvider);
    final textfontPro = ref.watch(textFontProvider);
    final textNamePro = ref.watch(textName1Provider);
    final textNameoptionalPro = ref.watch(textName2Provider);
    // final embroideryProviderWatch = ref.watch(embroideryProvider);
    // final addTextValue = ref.watch(embroideryProvider).addtext;
    // final addMessage = ref.watch(embroideryProvider).message;

    return Directionality(
      textDirection: AppConstant.selectedLanguage == 'EN'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Personalize your figs',
            style: AppTextStyles.body1,
          ),
        ),
        body: SingleChildScrollView(
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
                        child: Container(
                          // height: 480.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColors.myScaffold,
                            image: DecorationImage(
                              image: AssetImage(
                                AppImages.embroderyImage,
                              ),
                            ),
                          ),
                        ),
                        // CachedNetworkImage(
                        //   fit: BoxFit.fill,
                        //   imageUrl:
                        //       // 'https://pixlr.com/images/generator/photo-generator.webp',
                        //       '',
                        //   // height: 200.h,
                        //   placeholder: (context, url) => SizedBox(
                        //     width: double.infinity,
                        //     height: 480.h,
                        //     child: Center(
                        //       child: Image(
                        //         image: AssetImage(
                        //           AppImages.embroderyImage,
                        //         ),
                        //         width: double.infinity,
                        //         height: 480.h,
                        //         // opacity: AlwaysStoppedAnimation(0.3),
                        //         fit: BoxFit.contain,
                        //       ),
                        //     ),
                        //   ),

                        //   errorWidget: (context, url, error) => Icon(Icons.error),
                        // ),
                      ),
                    ),
                    // ----button----
                    Positioned(
                      top: 80.h,
                      left: textPositionPro == "Left Chest" ? 100.w : 0,
                      right: textPositionPro == "Right Chest" ? 100.w : 0,
                      child: SizedBox(
                        height: 24,
                        // width: 24,
                        child: Center(
                          child: Text(
                            // defineText,
                            textNamePro + textNameoptionalPro,
                            style: textfontPro == 'Block'
                                ? GoogleFonts.poppins(
                                    color: textColorPro == 'Black'
                                        ? AppColors.buttonColor
                                        : AppColors.myScaffold,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  )
                                : GoogleFonts.dancingScript(
                                    color: textColorPro == 'Black'
                                        ? AppColors.buttonColor
                                        : AppColors.myScaffold,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              addTextProviderWatch
                  ? SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context.pop();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      size: 15,
                                    ),
                                  ),
                                  Text(
                                    'Back',
                                    style: AppTextStyles.body1.copyWith(
                                      color: AppColors.black28,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                'Add Text',
                                style: AppTextStyles.body1.copyWith(
                                  color: AppColors.black28,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 15.w),
                                child: Text(
                                  '+14.00',
                                  style: AppTextStyles.body1.copyWith(
                                    color: AppColors.black28,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(color: AppColors.black28),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 24.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'First Line',
                                      style: AppTextStyles.body1.copyWith(
                                        color: AppColors.black28,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                // AppTextfields.sharpCornerTextField(
                                //   controller: AppTextfieldControllers
                                //       .embroideryfirstTextFieldControler,
                                //   lable: 'Write Here',
                                // ),

                                TextField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 12),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide:
                                            BorderSide(color: AppColors.grey)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide: BorderSide(
                                            color: AppColors.myPrimary)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide: const BorderSide(
                                            color: AppColors.myPrimary)),
                                    hintText: 'Write Here',
                                    hintStyle: TextStyle(
                                        color: AppColors.grey, fontSize: 13.sp),
                                    floatingLabelStyle: TextStyle(
                                      color: AppColors.myPrimary,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    ref.read(textName1Provider.notifier).state =
                                        value;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 24.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Second Line (Optional)',
                                      style: AppTextStyles.body1.copyWith(
                                        color: AppColors.black28,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                // AppTextfields.sharpCornerTextField(
                                //   controller: AppTextfieldControllers
                                //       .embroiderysecondTextFieldControler,
                                //   lable: 'Write Here',
                                // ),

                                TextField(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 12),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide:
                                            BorderSide(color: AppColors.grey)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide: BorderSide(
                                            color: AppColors.myPrimary)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide: const BorderSide(
                                            color: AppColors.myPrimary)),
                                    hintText: 'Write Here',
                                    hintStyle: TextStyle(
                                        color: AppColors.grey, fontSize: 13.sp),
                                    floatingLabelStyle: TextStyle(
                                      color: AppColors.myPrimary,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    ref.read(textName2Provider.notifier).state =
                                        value;
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 24.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 7.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        'SIZE TEXT POSITION',
                                        style: AppTextStyles.body1.copyWith(
                                          color: AppColors.black28,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(
                                        textPositionPro,
                                        style: AppTextStyles.body3,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(textPositionProvider.notifier)
                                            .state = 'Left Chest';
                                      },
                                      child: Container(
                                        height: 38.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            color:
                                                textPositionPro == 'Left Chest'
                                                    ? AppColors.black1C
                                                    : AppColors.myScaffold,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            border: Border.all(
                                              color: textPositionPro ==
                                                      'Left Chest'
                                                  ? AppColors.black1C
                                                  : AppColors.grey94,
                                            )),
                                        child: Center(
                                          child: Text(
                                            'Left Chest',
                                            style: AppTextStyles.body2.copyWith(
                                              color: textPositionPro ==
                                                      'Left Chest'
                                                  ? AppColors.myScaffold
                                                  : AppColors.black1C,

                                              // AppColors.myScaffold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.w),
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(textPositionProvider.notifier)
                                            .state = 'Right Chest';
                                      },
                                      child: Container(
                                        height: 38.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            color:
                                                textPositionPro == 'Right Chest'
                                                    ? AppColors.black1C
                                                    : AppColors.myScaffold,

                                            //  AppColors.black1C,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            border: Border.all(
                                              color: textPositionPro ==
                                                      'Right Chest'
                                                  ? AppColors.black1C
                                                  : AppColors.grey70,
                                            )),
                                        child: Center(
                                          child: Text(
                                            'Right Chest',
                                            style: AppTextStyles.body2.copyWith(
                                              color: textPositionPro ==
                                                      'Right Chest'
                                                  ? AppColors.myScaffold
                                                  : AppColors.black1C,

                                              //  AppColors.myScaffold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 24.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 7.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        'SELECT TEXT COLOR',
                                        style: AppTextStyles.body1.copyWith(
                                          color: AppColors.black28,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(
                                        textColorPro,
                                        style: AppTextStyles.body3,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(textColorProvider.notifier)
                                            .state = 'Black';
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10.w),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: textColorPro == 'Black'
                                                ? AppColors.myPrimary
                                                : AppColors.myScaffold,
                                          ),
                                        ),
                                        child: Container(
                                          height: 39.h,
                                          width: 39.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.black1C,
                                          ),
                                          child: textColorPro == 'Black'
                                              ? Icon(
                                                  Icons.check,
                                                  color: AppColors.myScaffold,
                                                )
                                              : SizedBox(),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(textColorProvider.notifier)
                                            .state = 'White';
                                      },
                                      child: Container(
                                        //   height: 39.h,
                                        // width: 39.w,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: textColorPro == 'White'
                                                ? AppColors.myPrimary
                                                : Colors.transparent,
                                          ),
                                        ),
                                        child: Container(
                                          height: 39.h,
                                          width: 39.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.myScaffold,
                                            border: Border.all(
                                                color: AppColors.grey),
                                          ),
                                          child: textColorPro == 'White'
                                              ? Icon(
                                                  Icons.check,
                                                )
                                              : SizedBox(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 24.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 7.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        'SIZE FONT TYPE',
                                        style: AppTextStyles.body1.copyWith(
                                          color: AppColors.black28,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(
                                        textfontPro,
                                        style: AppTextStyles.body3,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(textFontProvider.notifier)
                                            .state = 'Block';
                                      },
                                      child: Container(
                                        height: 38.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            color: textfontPro == 'Block'
                                                ? AppColors.black1C
                                                : AppColors.myScaffold,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            border: Border.all(
                                              color: textfontPro == 'Block'
                                                  ? AppColors.black1C
                                                  : AppColors.grey94,
                                            )),
                                        child: Center(
                                          child: Text(
                                            'Block',
                                            style: AppTextStyles.body2.copyWith(
                                              color: textfontPro == 'Block'
                                                  ? AppColors.myScaffold
                                                  : AppColors.black1C,

                                              // AppColors.myScaffold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(textFontProvider.notifier)
                                            .state = 'Script';
                                      },
                                      child: Container(
                                        height: 38.h,
                                        width: 100.w,
                                        // margin: EdgeInsets.only(left: 20.w),
                                        decoration: BoxDecoration(
                                            color: textfontPro == 'Script'
                                                ? AppColors.black1C
                                                : AppColors.myScaffold,

                                            //  AppColors.black1C,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            border: Border.all(
                                              color: textfontPro == 'Script'
                                                  ? AppColors.black1C
                                                  : AppColors.grey70,
                                            )),
                                        child: Center(
                                          child: Text(
                                            'Script',
                                            style: AppTextStyles.body2.copyWith(
                                              color: textfontPro == 'Script'
                                                  ? AppColors.myScaffold
                                                  : AppColors.black1C,

                                              //  AppColors.myScaffold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 15.w, right: 15.w, top: 24.h),
                              child: Divider(
                                color: AppColors.black28,
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 15.w, right: 15.w, top: 24.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 150.w,
                                    child: AppButtons.myOutlinedButton(
                                      onPressed: () {
                                        ref
                                            .read(textPositionProvider.notifier)
                                            .state = 'Left Chest';
                                        ref
                                            .read(textColorProvider.notifier)
                                            .state = 'Black';
                                        ref
                                            .read(textFontProvider.notifier)
                                            .state = 'Block';
                                      },
                                      text: 'RESEET',
                                      // textColor: AppColors.myScaffold,
                                      // color: AppColors.myScaffold,
                                      context: context,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150.w,
                                    child: AppButtons.myprimaryButton(
                                        onPressed: () {}, text: 'ADD +\$14'),
                                  ),
                                ],
                              )),
                          SizedBox(height: 15.h)
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 35.h),
                          child: Center(
                            child: Text(
                              'Embroidery Options',
                              style: AppTextStyles.headline1.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black28,
                              ),
                            ),
                          ),
                        ),
                        CheckboxListTile(
                          value: addTextProviderWatch,
                          onChanged: (value) {
                            ref.read(addTextBoolProvider.notifier).state =
                                value!;
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add Text',
                                style: AppTextStyles.body1.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '+14.00',
                                style: AppTextStyles.body1.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.buttonColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
