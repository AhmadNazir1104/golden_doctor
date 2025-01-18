
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';

import '../../view_models/embroidery_view_model/embroidery_view_model.dart';

String defineText = 'Ahmad';

class EmbroideryScreen extends ConsumerWidget {
  const EmbroideryScreen({super.key, });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final embroideryProviderWatch = ref.watch(embroideryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personalize your figs',
          style: AppTextStyles.body1,
        ),
      ),
      body: Column(
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
                  left: 100.w,
                  child: SizedBox(
                    height: 24,
                    // width: 24,
                    child: Center(
                        child: Text(
                      defineText,
                      style: AppTextStyles.body1.copyWith(fontSize: 14.sp),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text('data'),
          ),
        ],
      ),
    );
  }
}
