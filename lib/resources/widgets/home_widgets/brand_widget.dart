import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/models/home_model/brand_section_model.dart';
import 'package:golden_doctor/utils/app_fonts.dart';

class BrandWidget extends StatelessWidget {
  // final String imageVal;
  // final dynamic section;
  final BrandSection section;
  const BrandWidget({
    super.key,
    required this.section,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 36.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 12.h),
            child: Text(
              section.title,
              // 'Popular Brands',
              style: AppTextStyles.headline2,
            ),
          ),
          SizedBox(
            height: 65.h,
            child: ListView.builder(
              itemCount: section.body.length,
              // AppConstant.brandList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                Brand singleBrand = section.body[index];
                return InkWell(
                  onTap: () {
                    if (singleBrand.objType == 'collections') {
                      log('collections========');
                      context.push(
                        "/collection_product_screen",
                        extra: {
                          "collectionID": singleBrand.objId,
                          "collectionName": singleBrand.objName,
                        },
                      );
                    } else if (singleBrand.objType == 'product') {
                      log('product========');
                    } else {
                      log('product========');
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    height: 65.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(singleBrand.imageSrc.toString())
                          //  AssetImage(
                          //   AppConstant.brandList[index],
                          // ),
                          ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
