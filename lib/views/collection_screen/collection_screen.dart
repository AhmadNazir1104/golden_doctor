import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/resources/widgets/product_widget/product_widget.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_images.dart';
import 'package:golden_doctor/view_models/collection_view_model.dart';
import 'package:golden_doctor/view_models/language_provider.dart';

class CollectionScreen extends ConsumerWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Directionality(
        textDirection: AppConstant.selectedLanguage == 'EN'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(AppImages.horizantelLogo, height: 32),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                ref.read(filterProviderLocal.notifier).state = ref.watch(filterProvider);
                context.push("/filterScreen");
              },
              label: Text(
                "Filter".tr,
                style: AppTextStyles.body2.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              icon: Icon(Icons.tune),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 18, //170 / 350,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  // mainAxisExtent: 290,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                itemBuilder: (context, index) {
                  return ProductWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
