import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_constant.dart';

final obscureProvider = StateProvider<bool>((ref) => true);

// typedef StringValidationCallback = String Function(String);
class AppTextfields {
  static Widget myTextField({
    required TextEditingController controller,
    required String lable,
    required IconData icon,
    TextInputAction? textInputAction,
    TextInputType? textInputType,
    // StringValidationCallback? validation,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: appPaddingNormal),
      child: TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType ?? TextInputType.text,
        textInputAction: textInputAction ?? TextInputAction.next,
        showCursor: true,
        decoration: InputDecoration(
          // contentPadding: const EdgeInsets.symmetric(
          //   vertical: 10,
          // ),
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(5),
          //     borderSide: const BorderSide(color: AppColors.grey9098)),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(5),
          //     borderSide:
          //         BorderSide(color: AppColors.myPrimary)),
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(5),
          //     borderSide: const BorderSide(color: AppColors.myPrimary)),
          prefixIcon: Icon(icon),
          // prefixIconConstraints:
          //     const BoxConstraints(maxHeight: 24, maxWidth: 40, minWidth: 40),
          labelText: lable,
          labelStyle: TextStyle(color: AppColors.grey),
          // prefix: Icon(icon),
          floatingLabelStyle:
              TextStyle(color: AppColors.myPrimary, fontSize: 13),
        ),
        validator:
            // StringValidationCallback("")
            (value) {
          // const pattern = (r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
          // final regExp = RegExp(pattern);
          if (value!.contains(' ') || value.isEmpty) {
            return 'Cant have blank or Empty spaces';
          } else {
            return null;
          }
        },
      ),
    );
  }

  static Widget passwordFiled({
    required TextEditingController controller,
    required String lable,
    TextInputAction? textInputAction,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        bool obscureText = ref.watch(obscureProvider);
        return Padding(
          padding: EdgeInsets.only(bottom: appPaddingNormal),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: TextInputType.visiblePassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onEditingComplete: () => TextInput.finishAutofillContext(),
            textInputAction: textInputAction ?? TextInputAction.next,
            decoration: InputDecoration(
              // isDense: true,
              // contentPadding: const EdgeInsets.symmetric(vertical: 10),
              // enabledBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(5),
              //     borderSide: const BorderSide(color: AppColors.grey9098)),
              // border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(5),
              //     borderSide:
              //         BorderSide(color: AppColors.myPrimary)),
              // focusedBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(5),
              //     borderSide: const BorderSide(color: AppColors.myPrimary)),
              // prefixIcon: const Icon(
              //   Icons.lock_outlined,
              //   color: AppColors.grey9098,
              // ),
              // prefixIconConstraints: const BoxConstraints(
              //   maxHeight: 24,
              //   maxWidth: 40,
              //   minWidth: 40,
              // ),
              labelText: lable,

              labelStyle: TextStyle(color: AppColors.grey, fontSize: 13),
              floatingLabelStyle:
                  TextStyle(color: AppColors.myPrimary, fontSize: 13),
              prefixIcon: Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                  onPressed: () {
                    ref.read(obscureProvider.notifier).state = !obscureText;
                  },
                  icon: Icon(
                    obscureText == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.grey,
                  )),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill all Form';
              } else {
                return null;
              }
            },
          ),
        );
      },
    );
  }

  static Widget sharpCornerTextField({
    required TextEditingController controller,
    required String lable,
    TextInputAction? textInputAction,
    TextInputType? textInputType,
  }) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textInputType ?? TextInputType.emailAddress,
      textInputAction: textInputAction ?? TextInputAction.next,
      enableInteractiveSelection: true,
      showCursor: true,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: AppColors.grey)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: AppColors.myPrimary)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(color: AppColors.myPrimary)),
        labelText: lable,
        labelStyle: TextStyle(color: AppColors.grey, fontSize: 13),
        floatingLabelStyle: TextStyle(color: AppColors.myPrimary, fontSize: 13),
      ),
    );
  }
}
