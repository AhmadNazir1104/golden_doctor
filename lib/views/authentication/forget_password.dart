import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_keys.dart';
import 'package:golden_doctor/utils/app_textfield_controllers.dart';
import 'package:golden_doctor/view_models/authentication_view_model.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_textfield.dart';
import 'package:golden_doctor/view_models/language_provider.dart';

class ForgetPasswordScreen extends ConsumerWidget {
  const ForgetPasswordScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool bolleanvalue = ref.watch(apiServiceProvider).boleanValue;
    return Directionality(
      textDirection: AppConstant.selectedLanguage == 'EN'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Forget Password'.tr,
            // style: AppTextStyles.smallBody,
          ),
          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     icon: const Icon(
          //       Icons.arrow_back_ios_new,
          //       color: AppColors.dark2232,
          //     )),
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
                child: Form(
                  key: AppAllKeys.forgetPasswordFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: 152.h, width: 25),
                      //=====================logo===========================//
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: SizedBox(
                      //     // color: AppColors.dark2232,
                      //     height: 350.h,
                      //     // child: Lottie.asset(
                      //     //   AppImages.forgetPassword,
                      //     // ),
                      //   ),
                      // ),
                      // const Spacer(),
                      //=====================Text========================//
                      Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: Text(
                          "Enter the email address associated with your account."
                              .tr,
                          textAlign: TextAlign.center,
                          style:
                              AppTextStyles.body2, // AppTextStyles.normalBody,
                        ),
                      ),

                      Text(
                        'We will email you a link to restart your password.'.tr,
                        style: AppTextStyles
                            .lable3, //TextStyle(fontSize: 12, color: Colors.grey[400]),
                      ),
                      const SizedBox(height: 10),

                      //===============Textfields====================//

                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: AppTextfields.myTextField(
                            controller:
                                AppTextfieldControllers.forgetPasswordEmail,
                            lable: "Enter email".tr,
                            icon: Icons.email_outlined),
                      ),

                      //====================Test-button==============================//
                      bolleanvalue
                          ? const CircularProgressIndicator()
                          : Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  // if (AppAllKeys
                                  //     .forgetPasswordFormKey.currentState!
                                  //     .validate()) {
                                  //   ref
                                  //       .read(apiServiceProvider.notifier)
                                  //       .changeUserPassword(
                                  //         context,
                                  //         AppTextfieldControllers
                                  //             .forgetPasswordEmail.text,
                                  //       );
                                  //   AppTextfieldControllers.forgetPasswordEmail
                                  //       .clear();
                                  // } else {
                                  //   Fluttertoast.showToast(
                                  //       msg: "Enter Email first");
                                  //   AppTextfieldControllers.forgetPasswordEmail
                                  //       .clear();
                                  // }
                                },
                                child: Text(
                                  'Send'.tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                      // Spacer(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
