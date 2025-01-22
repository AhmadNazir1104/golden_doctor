import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/models/home_model/home_model.dart';
import 'package:golden_doctor/resources/widgets/home_widgets/maching_pair_widget.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';
import 'package:golden_doctor/resources/widgets/home_widgets/category_carousel_widget.dart';
import 'package:golden_doctor/resources/widgets/home_widgets/product_carusel_widget.dart';
import 'package:golden_doctor/resources/widgets/home_widgets/single_banner_widget.dart';
import 'package:golden_doctor/view_models/home_view_model/home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionsState = ref.watch(sectionsProvider);
    // final selectedLanguage = ref.watch(languageProvider);

    // Check if the selected language is right-to-left
    // final isRtl = selectedLanguage == Language.arabic ||
    //     selectedLanguage == Language.urdu;
    return Directionality(
      textDirection: AppConstant.selectedLanguage == 'EN'
          ? TextDirection.ltr
          : TextDirection.rtl,
      //  isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(AppImages.horizantelLogo, height: 32),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search_rounded,
              ),
              onPressed: () {
                context.push('/embroidery_screen');
              },
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.barcode_viewfinder,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: sectionsState.when(
          data: (sectionsModel) {
            if (sectionsModel == null || sectionsModel.sections!.isEmpty) {
              return Center(
                  child: Text(
                "No sections available",
                style: AppTextStyles.body1,
              ));
            }
            return ListView.builder(
              itemCount: sectionsModel.sections!.length,
              itemBuilder: (context, index) {
                final section = sectionsModel.sections![index];
                return _buildSectionBody(section);
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
              child: Text(
            "Error: $error",
            style: AppTextStyles.body1,
          )),
        ),
        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       ///////////////////////////////// Single Banner  Widget  /////////////////////////////////
        //       Padding(
        //         padding: EdgeInsets.only(bottom: 36.h),
        //         child: SingleBannerWidget(
        //           image: AppImages.singleBanner,
        //           height: 578.h,
        //           width: 375.w,
        //         ),
        //       ),
        //       ///////////////////////////////// Brand Widget  /////////////////////////////////
        //       BrandWidget(imageVal: ''),
        //       ///////////////////////////////// Product Carusel Widget  /////////////////////////////////
        //       ProductCaruselWidget(
        //           productCaruselName: 'Popular Product',
        //           productCaruselList: 'productCaruselList'),
        //       ///////////////////////////////// Category Carusel Widget  /////////////////////////////////
        //       CategoryCarouselWidget(
        //         categoryName: 'Popular Category',
        //         voidCallback: () {
        //           context.push('/collectionScreen');
        //         },
        //       ),
        //       ///////////////////////////////// Product Carusel Widget  /////////////////////////////////
        //       ProductCaruselWidget(
        //           productCaruselName: 'New Arrivals',
        //           productCaruselList: 'productCaruselList'),
        //       ///////////////////////////////// Create Your Set Widget  /////////////////////////////////

        //       CreateYourSetWidget(setname: 'Create your set'),
        //       ///////////////////////////////// Product Carusel Widget  /////////////////////////////////
        //       ProductCaruselWidget(
        //           productCaruselName: 'Accessories',
        //           productCaruselList: 'productCaruselList'),
        //       ///////////////////////////////// Single Banner Widget  /////////////////////////////////
        //       Padding(
        //         padding: EdgeInsets.only(bottom: 36.h),
        //         child: SingleBannerWidget(
        //           image: AppImages.promotionBanner,
        //           height: 155.h,
        //           width: 375.w,
        //         ),
        //       ),
        //       ///////////////////////////////// Product Carusel Widget  /////////////////////////////////
        //       ProductCaruselWidget(
        //           productCaruselName: 'Accessories',
        //           productCaruselList: 'productCaruselList',),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget _buildSectionBody(Section section) {
    switch (section.type) {
      case 'categories_carousel':
        return CategoryCarouselWidget(
          // categoryName: 'Popular Category',
          // voidCallback: () {
          //   // context.push('/collectionScreen');
          // },
          section: section,
        );
      //  _buildCategoriesCarousel(section.body);
      // case 'banner_slider':
      //   return Padding(
      //     padding: EdgeInsets.only(bottom: 36.h),
      //     child: SingleBannerWidget(
      //       image: AppImages.promotionBanner,
      //       height: 155.h,
      //       width: 375.w,
      //     ),
      //   );
      // _buildBannerSlider(section.body);
      case 'matching_pairs':
        return MachingPairWidgetWidget(
          section: section,
          // image: AppImages.singleBanner,
          // height: double.parse(section.height.toString()),
          // voidCallback: () {},
        );
      // case 'two_banners':
      //   return Text('two_banners');
      // case 'four_banners_section':
      //   return Text('four_banners_section');
      case 'single_banner':
        return Padding(
          padding: EdgeInsets.only(bottom: 36.h),
          child: SingleBannerWidget(
            // image: AppImages.promotionBanner,
            // height: 155.h,
            // width: 375.w,
            section: section,
          ),
        );
      case 'products_carousel':
        return ProductCaruselWidget(
            productCaruselName: 'New Arrivals',
            productCaruselList: 'productCaruselList');
      // _buildProductsCarousel(section.body);

      default:
        return Center(
            child: Text(
          "No sections available",
          style: AppTextStyles.body1,
        ));
    }
  }
}
