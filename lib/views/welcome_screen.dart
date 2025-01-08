import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_button.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/app_images/backgroundImage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Spacer(),
            Image.asset(
              "assets/app_images/logoImage.png",
              height: 75.h,
              width: 75.w,
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.h, bottom: 30),
              child: Text(
                "Let's Shop Now!",
                style: AppTextStyles.headline1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Text(
                'Dive in and discover a world of possibilities\n waiting for you.',
                style: AppTextStyles.body2,
                textAlign: TextAlign.center,
              ),
            ),
            AppButtons.myprimaryButton(
              onPressed: () {
                context.push("/signinScreen");
              },
              text: "Log in",
            ),
            SizedBox(height: 20.h),
            AppButtons.myOutlinedButton(
              context: context,
              text: "Create an Account",
              onPressed: () {
                context.push("/signupScreen");
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(),
                    ),
                  ),
                  Text("or", style: AppTextStyles.body2),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(),
                    ),
                  ),
                ],
              ),
            ),
            AppButtons.myTextButton(
              text: "Continue as a Guest",
              onPressed: () {
                context.go("/setBuilderScreen");
              },
              context: context,
              textStyle: AppTextStyles.body3.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.blueC50,
              ),
            ),
            SizedBox(height: 30.h)
          ],
        ),
      ),
    );
  }
}
