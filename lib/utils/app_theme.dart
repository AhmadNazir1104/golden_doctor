import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

ThemeData myTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: AppColors.myPrimary,
    scaffoldBackgroundColor: AppColors.myScaffold,
    primaryColorLight: AppColors.myPrimary,
    // ignore: prefer_const_constructors
    // useMaterial3: true,
    appBarTheme: AppBarTheme(
        shadowColor: Colors.transparent,
        elevation: 0.0,
        backgroundColor: AppColors.myScaffold,
        iconTheme: CupertinoIconThemeData(
          color: AppColors.black2022,
        ), // const IconThemeData(color: AppColors.dark2232),
        centerTitle: true,

        // systemOverlayStyle:
        // const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        // toolbarHeight: 40.h,
        titleTextStyle: AppTextStyles.headline2,
        actionsIconTheme: const IconThemeData(color: AppColors.black2022)
        // TextStyle(
        //     color: AppColors.dark2232,
        //     fontSize: 16.sp,
        //     fontWeight: FontWeight.w700)
        // preferredSize: const Size.fromHeight(25.0),
        ),
    primaryIconTheme: IconThemeData(color: AppColors.black2022, size: 24.h),
    iconTheme: const IconThemeData(color: AppColors.black2022),
    textTheme: GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme,
    )
        .apply(
          bodyColor: AppColors.myPrimary,
          fontSizeDelta: 2.5.sp,
        )
        .copyWith(
          
          headlineLarge: AppTextStyles.headline1,
          headlineMedium: AppTextStyles.headline1,
          headlineSmall: AppTextStyles.headline1,
          bodyLarge: AppTextStyles.body1,
          bodyMedium: AppTextStyles.body2,
          bodySmall: AppTextStyles.body3,
        ),
    // ).apply(bodyColor: AppColors.dark2232, fontSizeDelta: 2.5.sp),
    // .apply(bodyColor: kContentColorLightTheme),
    colorScheme: const ColorScheme.light(
      primary: AppColors.myPrimary,
      secondary: AppColors.myPrimary,
      error: AppColors.redFB71,
    ),
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: AppTextStyles.body1,
      backgroundColor: AppColors.myScaffold,
      actionTextColor: AppColors.myPrimary,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.myScaffold,
      selectedItemColor: AppColors.black2022,
      unselectedItemColor: AppColors.grey9c,
      selectedIconTheme: IconThemeData(color: AppColors.black2022),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.buttonColor),
          // overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.2)),
          textStyle: WidgetStateProperty.all(
            TextStyle(
              color: AppColors.myScaffold,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "Poppins",
            ),
          )),
    ),
  );
}
