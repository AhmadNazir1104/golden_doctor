import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_fonts.dart';

enum ButtonRoundedSide { none, leftSide, rightSide, bothSide }

class AppButtons {
  static Widget myprimaryButton({
    required VoidCallback onPressed,
    required String text,
    Color? textColor,
    double? height,
    Color color = AppColors.myPrimary,
    ButtonRoundedSide buttonSideCurve = ButtonRoundedSide.bothSide,
  }) {
    height = height ?? 45.h;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(343.w, height.h),
          // shape: LinearBorder(),
          shape: RoundedRectangleBorder(
            borderRadius: buttonSideCurve == ButtonRoundedSide.bothSide
                ? BorderRadius.circular(5)
                : buttonSideCurve == ButtonRoundedSide.none
                    ? BorderRadius.circular(0)
                    : buttonSideCurve == ButtonRoundedSide.leftSide
                        ? const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5))
                        : const BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5)),
          ),
          backgroundColor: color,
          textStyle: TextStyle(
            color: AppColors.myScaffold,
          )),
      child: Text(
        text,
        style: AppTextStyles.headline3.copyWith(
          color: textColor?? AppColors.myScaffold,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  static Widget myTextButton({
    required String text,
    required VoidCallback onPressed,
    TextStyle? textStyle,
    required BuildContext context,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  // color: AppColors.myPrimary,
                  fontWeight: FontWeight.w700,
                ),
      ),
    );
  }

  static Widget myRangeButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required IconData icon,
    ButtonRoundedSide buttonSideCurve = ButtonRoundedSide.bothSide,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(22.w, 20.h),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: buttonSideCurve == ButtonRoundedSide.bothSide
              ? BorderRadius.circular(5)
              : buttonSideCurve == ButtonRoundedSide.none
                  ? BorderRadius.circular(0)
                  : buttonSideCurve == ButtonRoundedSide.leftSide
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5))
                      : const BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5)),
        ),
        backgroundColor: AppColors.myScaffold,
        textStyle: Theme.of(context).textTheme.headlineMedium,
      ),
      child: Center(
        child: Icon(
          icon,
          color: AppColors.grey70,
        ),
      ),
    );
  }

  static Widget myOutlinedButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(343.w, 41.h),
        // padding: EdgeInsets.symmetric(vertical: 15.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: AppColors.myPrimary,
            width: 1,
          ),
        ),
        // fixedSize: Size(double.infinity, 38),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.myPrimary,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          // fontFamily: "Poppins",
        ),
      ),
    );
  }
}
