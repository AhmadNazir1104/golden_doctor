import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/resources/widgets/product_widget/color_palette_Widget.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_button.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/selectable_textbox.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';

class SetBuilderScreen extends StatelessWidget {
  const SetBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List col = [
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

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/app_images/horizantelLogo.png", height: 32),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.barcode_viewfinder),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 30.h,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -------- images ----------
                Container(
                  color: AppColors.greyF2,
                  height: 683.h,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      spacing: 20.h,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              "assets/app_images/tshirtImage.png",
                              fit: BoxFit.fitHeight,
                              height: 180.h,
                              width: double.infinity,
                            ),
                            Positioned(
                              top: 88.h,
                              left: 0.w,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_left),
                              ),
                            ),
                            Positioned(
                              top: 88.h,
                              right: 0.w,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_right),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              "assets/app_images/trouserImage.png",
                              // fit: BoxFit.fitWidth,
                              width: double.infinity,
                              // MediaQuery.of(context).size.width * 0.5 - 90,
                              height: 272.h,
                            ),
                            Positioned(
                              top: 88.h,
                              left: 0.w,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_left),
                              ),
                            ),
                            Positioned(
                              top: 88.h,
                              right: 0.w,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_right),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // -------- product description ---------
                Expanded(
                  child: Column(
                    children: [
                      // --------- shirt --------
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 7.h,
                          children: [
                            Text(
                              "Catarina One-Pocket Scrub Top™",
                              style: AppTextStyles.headline3.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "\$ 38.00",
                              style: AppTextStyles.lable3.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "COLOR ",
                                  style: AppTextStyles.headline3.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Black",
                                  style: AppTextStyles.lable3.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 29,
                              child: ListView.builder(
                                  itemCount: col.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return ColorPaletteWidget(
                                      colorName: col[index],
                                    );
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: AppButtons.myprimaryButton(
                                onPressed: () {},
                                height: 30.h,
                                text: "What’s My size",
                                color: AppColors.greyF2,
                                textColor: AppColors.black1C,
                              ),
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
                            SizedBox(
                              height: 29,
                              child: ListView.builder(
                                itemCount: col.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return SelectableTextBox(
                                    text: AppConstant.sizesList[index],
                                    isSelected: index == 0 ? true : false,
                                  );
                                },
                              ),
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
                          ],
                        ),
                      ),
                      Divider(),
                      // --------- pant --------
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 7.h,
                          children: [
                            Text(
                              "Catarina One-Pocket Scrub Top™",
                              style: AppTextStyles.headline3.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "\$ 38.00",
                              style: AppTextStyles.lable3.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "COLOR ",
                                  style: AppTextStyles.headline3.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Black",
                                  style: AppTextStyles.lable3.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 29,
                              child: ListView.builder(
                                  itemCount: col.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return ColorPaletteWidget(
                                      colorName: col[index],
                                    );
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: AppButtons.myprimaryButton(
                                onPressed: () {},
                                height: 30.h,
                                text: "What’s My size",
                                color: AppColors.greyF2,
                                textColor: AppColors.black1C,
                              ),
                            ),
                            SizedBox(
                              height: 29,
                              child: ListView.builder(
                                itemCount: col.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return SelectableTextBox(
                                    text: AppConstant.sizesList[index],
                                    isSelected: index == 0 ? true : false,
                                  );
                                },
                              ),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppButtons.myprimaryButton(
              onPressed: () {},
              text: "ADD TO BAG",
            ),
            Divider(),
            Text("Customize your scrub sets", style: AppTextStyles.headline3),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.w),
              child: Text(
                "Shopping for uniforms doesn’t have to be uniform. Our advanced custom Scrub Set Builder allows you to pair your favorite styles, fits and colors, including black, green and blue, to customize your perfect scrub set. Just scroll, pair and click. It’s that simple.",
                style: AppTextStyles.lable2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
