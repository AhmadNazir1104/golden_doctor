import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/resources/widgets/product_widget/color_palette_Widget.dart';
import 'package:golden_doctor/resources/widgets/product_widget/product_bottom_sheet_widget.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_button.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/selectable_textbox.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 479.h,
            pinned: true,
            backgroundColor: AppColors.myScaffold,
            elevation: 0,
            forceElevated: false,
            surfaceTintColor: AppColors.myScaffold,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.zero,
              collapseMode: CollapseMode.pin,
              background: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.blue,
              ),

              // title: Text("title"),
            ),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 30.h),
              child: Container(
                height: 30.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(70),
                  ),
                  color: AppColors.myScaffold,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    "Catarina One-Pocket Scrub Top™",
                    style: AppTextStyles.headline2.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Brand Name",
                    style: AppTextStyles.lable3.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        "COLOR    ",
                        style: AppTextStyles.headline3.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text("Black", style: AppTextStyles.lable3),
                    ],
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
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        "SIZE TYPE    ",
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
                  SizedBox(height: 10.h),
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
                        "What's my size?",
                        style: AppTextStyles.lable3.copyWith(
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
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text("SAR 350"),
                      SizedBox(width: 20),
                      Flexible(
                        child: AppButtons.myprimaryButton(
                          onPressed: () {},
                          text: 'ADD TO BAG',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
