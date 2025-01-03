import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_images.dart';
import 'package:golden_doctor/view_models/language_provider.dart';
import 'package:golden_doctor/widgets/home_widgets/brand_widget.dart';
import 'package:golden_doctor/widgets/home_widgets/single_banner_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(languageProvider);

    // Check if the selected language is right-to-left
    final isRtl = selectedLanguage == Language.arabic ||
        selectedLanguage == Language.urdu;
    return Scaffold(
      appBar: AppBar(),
      body: Directionality(
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///////////////////////////////// Single Banner  Widget  /////////////////////////////////
              Padding(
                padding: EdgeInsets.only(bottom: 36.h),
                child: SingleBannerWidget(
                  image: AppImages.singleBanner,
                  height: 578.h,
                  width: 375.w,
                ),
              ),
              ///////////////////////////////// Brand Widget  /////////////////////////////////
              BrandWidget(imageVal: ''),

              ///////////////////////////////// Single Banner Widget  /////////////////////////////////

              Padding(
                padding: EdgeInsets.only(bottom: 36.h),
                child: SingleBannerWidget(
                  image: AppImages.promotionBanner,
                  height: 155.h,
                  width: 375.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
