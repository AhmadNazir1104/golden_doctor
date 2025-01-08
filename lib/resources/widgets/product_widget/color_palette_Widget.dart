import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';

var list = [
  {
    "title": "black",
    "code": "0xFF000000",
  },
  {
    "title": "green",
    "code": "0xFF00C817",
  },
  {
    "title": "white",
    "code": "0xffFAFAFA",
  },
  {
    "title": "yello",
    "code": "0xffFFFF00",
  },
  {
    "title": "orange",
    "code": "0xffFFA500",
  },
  {
    "title": "read",
    "code": "0xffC20E0F",
  },
  {
    "title": "white",
    "code": "0xffFAFAFA",
  },
];

class ColorPaletteWidget extends StatelessWidget {
  final String colorName;
  const ColorPaletteWidget({
    super.key,
    required this.colorName,
  });

  @override
  Widget build(BuildContext context) {
    // var color = "black";
    var code = list.firstWhereOrNull((e) {
      return e["title"] == colorName;
    });
    return code == null
        ? GestureDetector(
            onTap: () {
              AppConstant.selectedColor = colorName;
              print(AppConstant.selectedColor);
            },
            child: Container(
              margin: EdgeInsets.only(left: 12.w),

              // height: 20.h, // Ensure consistent height
              width: 70.w, // Ensure consistent width
              decoration: BoxDecoration(
                border: Border.all(
                    color: AppConstant.selectedColor == colorName
                        ? AppColors.black1C
                        : Colors.transparent,
                    width: 1),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  colorName,
                  style: AppTextStyles.lable1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )

        // Text(
        //     colorName,
        //     style: AppTextStyles.lable1,
        //   )
        : InkWell(
            onTap: () {
              AppConstant.selectedColor = colorName;
              print(AppConstant.selectedColor);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Container(
                height: 35.h,
                width: 35.w,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppConstant.selectedColor == colorName
                        ? AppColors.black1C
                        : Colors.transparent,
                    width: 1,
                  ),
                  color: AppColors.myScaffold,
                ),
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppConstant.selectedColor == colorName
                          ? AppColors.black1C
                          : Colors.transparent,
                      width: 1,
                    ),
                    color: Color(int.parse(code["code"].toString())),
                  ),
                  child: Center(
                    child: AppConstant.selectedColor == colorName
                        ? Icon(
                            Icons.check,
                            color: AppColors.myScaffold,
                          )
                        : SizedBox(),
                  ),
                ),
              ),
            ),
          );
  }
}
