import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/utils/app_keys.dart';
import 'package:golden_doctor/utils/app_textfield_controllers.dart';
import 'package:golden_doctor/view_models/authentication_view_model.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_button.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_textfield.dart';
import 'package:golden_doctor/view_models/language_provider.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignInScreen> {
  @override
  void dispose() {
    AppTextfieldControllers.signInEmail.clear();
    AppTextfieldControllers.signInPassword.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool isObscure = ref.watch(testProvider);

    bool authenticationService = ref.watch(apiServiceProvider).boleanValue;

    return Directionality(
      textDirection: AppConstant.selectedLanguage == 'EN'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // title: Text("ACCOUNT"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: AppAllKeys.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //=====================logo===========================//
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          'Welcome Back, Shopioholic!'.tr,
                          style: AppTextStyles
                              .headline1, //AppTextStyles.largeHeading,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'We are thrilled to have you back! Log in to Shopio and shop till you drop.'
                              .tr,
                          style: AppTextStyles.body2,
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 3),
                      //   child: Text.rich(
                      //     TextSpan(
                      //       children: [
                      //         WidgetSpan(
                      //           child: InkWell(
                      //             onTap: () {
                      //               context.pushReplacement('/signupScreen');
                      //             },
                      //             child: Text(
                      //               'REGISTER HERE',
                      //               style: Theme.of(context)
                      //                   .textTheme
                      //                   .bodyLarge!
                      //                   .copyWith(
                      //                     decoration: TextDecoration.underline,
                      //                   ),
                      //             ),
                      //           ),
                      //         ),
                      //         TextSpan(
                      //           text: '  TO AVAIL NEW MEMBERSHIP DISCOUNTS!',
                      //           style: Theme.of(context).textTheme.bodyMedium,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 30),
                      AppTextfields.myTextField(
                        controller: AppTextfieldControllers.signInEmail,
                        lable: "Enter your email".tr,
                        icon: Icons.email_outlined,
                      ),
                      AppTextfields.passwordFiled(
                        lable: "Enter your password".tr,
                        controller: AppTextfieldControllers.signInPassword,
                        textInputAction: TextInputAction.done,
                      ),
                      //====================Forget Button==============================//
                      Align(
                        alignment: Alignment.centerRight,
                        child: AppButtons.myTextButton(
                          context: context,
                          text: "Forget Password?".tr,
                          // textStyle: Theme.of(context).textTheme.labelMedium,
                          onPressed: () {
                            context.push('/forgetPasswordScreen');
                          },
                        ),
                      ),
                      //====================Next-button==============================//
                      authenticationService
                          ? Center(child: const CircularProgressIndicator())
                          : AppButtons.myprimaryButton(
                              buttonSideCurve: ButtonRoundedSide.bothSide,
                              // context: context,
                              text: "Sign In".tr,
                              onPressed: () {
                                ref.read(apiServiceProvider.notifier).login(
                                      context,
                                      AppTextfieldControllers.signInEmail.text,
                                      AppTextfieldControllers
                                          .signInPassword.text,
                                    );
                              },
                            ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don`t have an account?'.tr,
                            style: AppTextStyles.body2,
                            // TextStyle(color: Colors.grey[400], fontSize: 12),
                          ),
                          AppButtons.myTextButton(
                            context: context,
                            text: "Sign Up".tr,
                            onPressed: () {
                              context.pushReplacement('/signupScreen');
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By continuing, I agree to '.tr,
                                  style: AppTextStyles.body3,
                                ),
                                WidgetSpan(
                                  child: InkWell(
                                    onTap: () {
                                      // context.pushReplacement('/signupScreen');
                                    },
                                    child: Text(
                                      'Terms of Conditions '.tr,
                                      style: AppTextStyles.body3.copyWith(
                                          fontWeight: FontWeight.w700
                                          // decoration: TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: 'and\n'.tr,
                                  style: AppTextStyles.body3,
                                ),
                                WidgetSpan(
                                  child: InkWell(
                                    onTap: () {
                                      // context.pushReplacement('/signupScreen');
                                    },
                                    child: Text(
                                      'Privacy of Policy '.tr,
                                      style: AppTextStyles.body3.copyWith(
                                          fontWeight: FontWeight.w700
                                          // decoration: TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
