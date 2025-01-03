import 'package:flutter/material.dart';

class AppTextfieldControllers {
  static final TextEditingController signInEmail = TextEditingController();
  static final TextEditingController signInPassword = TextEditingController();
  static final TextEditingController signUpFirstName = TextEditingController();
  static final TextEditingController signUpLastName = TextEditingController();
  static final TextEditingController signUpEmail = TextEditingController();
  static final TextEditingController signUpPassword = TextEditingController();
  static final TextEditingController signUpConfirmPassword =
      TextEditingController();
  static final TextEditingController cartCoupen = TextEditingController();
  static final TextEditingController homeSearch = TextEditingController();
  static final TextEditingController forgetPasswordEmail =
      TextEditingController();
  static claerControllers() {
    signInEmail.clear();
    signInPassword.clear();
    signUpFirstName.clear();
    signUpLastName.clear();
    signUpEmail.clear();
    signUpPassword.clear();
    signUpConfirmPassword.clear();
    cartCoupen.clear();
    homeSearch.clear();
    forgetPasswordEmail.clear();
  }
}
