import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/utils/app_keys.dart';
import 'package:golden_doctor/utils/app_textfield_controllers.dart';
import 'package:golden_doctor/view_models/authentication_view_model.dart';
import 'package:golden_doctor/widgets/universal_widget/app_button.dart';
import 'package:golden_doctor/widgets/universal_widget/app_textfield.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool todos = ref.watch(apiServiceProvider).boleanValue;
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 45, 20, 20),
              child: Form(
                key: AppAllKeys.signupFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //=====================logo===========================//
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Welcome!',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge, //AppTextStyles.largeHeading,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'We are thrilled to have you back! Log in to Shopio and shop till you drop.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),

                    //===============Textfields====================//

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 30),
                      child: Column(
                        children: [
                                                  AppTextfields.myTextField(
                              controller: AppTextfieldControllers.signUpEmail,
                              lable: "Enter your email",
                              icon: Icons.email_outlined),
                          AppTextfields.passwordFiled(
                            lable: "Enter your password",
                            controller: AppTextfieldControllers.signUpPassword,
                          ),
                          AppTextfields.passwordFiled(
                            lable: "Confirm Password",
                            controller:
                                AppTextfieldControllers.signUpConfirmPassword,
                            textInputAction: TextInputAction.done,
                            // obscureText: isObscure,
                          ),
                        ],
                      ),
                    ),
                    // --------- Sign in button ---------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: Theme.of(context).textTheme.bodyMedium,
                          // TextStyle(color: Colors.grey[400], fontSize: 12),
                        ),
                        AppButtons.myTextButton(
                          context: context,
                          text: "Sign In",
                          onPressed: () {
                            context.pushReplacement('/signinScreen');
                          },
                        ),
                      ],
                    ),
                    //====================Next-button==============================//
                    todos
                        ? Center(child: const CircularProgressIndicator())
                        : AppButtons.myprimaryButton(
                            // context: context,
                            buttonSideCurve: ButtonRoundedSide.bothSide,
                            text: "Sign In",
                            onPressed: () {
                              if (AppAllKeys.signupFormKey.currentState!
                                      .validate() &&
                                  AppTextfieldControllers.signUpPassword.text ==
                                      AppTextfieldControllers
                                          .signUpConfirmPassword.text) {
                                ref.read(apiServiceProvider.notifier).signUp(
                                      context,
                                      AppTextfieldControllers.signUpEmail.text,
                                      AppTextfieldControllers
                                          .signUpPassword.text,
                                      AppTextfieldControllers
                                          .signUpFirstName.text,
                                      AppTextfieldControllers
                                          .signUpLastName.text,
                                    );
                              } else {
                                log("not validated");
                                Fluttertoast.showToast(
                                  msg: " Try Again ",
                                );
                                // AppTextfieldControllers.claerControllers();
                              }
                            },
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
                                text: 'By continuing, I agree to ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () {
                                    // context.pushReplacement('/signupScreen');
                                  },
                                  child: Text(
                                    'Terms of Conditions ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontWeight: FontWeight.w700
                                            // decoration: TextDecoration.underline,
                                            ),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: 'and\n',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              WidgetSpan(
                                child: InkWell(
                                  onTap: () {
                                    // context.pushReplacement('/signupScreen');
                                  },
                                  child: Text(
                                    'Privacy of Policy ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontWeight: FontWeight.w700
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
    );
  }
}
