import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_doctor/models/cart/cart_model.dart';
import 'package:golden_doctor/resources/services/shearedpreference_service.dart';
import 'package:golden_doctor/resources/widgets/cart_widgets/cart_card_widget.dart';
import 'package:golden_doctor/resources/widgets/universal_widget/app_button.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:golden_doctor/utils/app_constant.dart';
import 'package:golden_doctor/utils/app_fonts.dart';
import 'package:golden_doctor/view_models/cart_view_model.dart';
import 'package:golden_doctor/view_models/checkout_view_model.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool boleaNVal = ref.watch(checkoutApiServiceProvider).boleanValue;
    List<CartModel> cartList = ref.watch(cartProvider);
    final cartRead = ref.read(cartProvider.notifier);

    if (cartList.isEmpty) {
      cartRead.getCart();
    }
    return Directionality(
      textDirection: AppConstant.selectedLanguage == 'EN'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            cartList.length > 1
                ? 'Bag (${cartList.length} Items)'
                : 'Bag (${cartList.length} Item)',
            style: AppTextStyles.body2,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CartCardWidget(),
              Expanded(
                child: cartList.isNotEmpty
                    ? ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          return CartCardWidget(
                            cartIndex: index,
                          );
                        },
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.folder_off_outlined),
                            Text(
                              "Empty",
                              style: AppTextStyles.headline3
                                  .copyWith(color: AppColors.myPrimary),
                            ),
                          ],
                        ),
                      ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 21.h),
                    child: SizedBox(
                      width: 51.w,
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 21.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Subtotal',
                            style: AppTextStyles.body2.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: cartRead.totalItemCount > 1
                                    ? '(${cartRead.totalItemCount} Items)'
                                    : '(${cartRead.totalItemCount} Item)',
                                style: AppTextStyles.body3.copyWith(
                                  color: AppColors.grey70,
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          'SAR ${cartRead.totalItemPrice}',
                          style: AppTextStyles.body2,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 21.h),
                    child: Divider(),
                  ),
                  AppButtons.myprimaryButton(
                    onPressed: () {
                      ref
                          .read(checkoutApiServiceProvider.notifier)
                          .addToCartShopify(
                            context,
                            ShearedprefService.getUserGmail() ?? "",
                            cartList,
                          );
                    },
                    text: 'Checkout',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
