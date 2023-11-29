import 'package:aviator_delivery/constants/app_colors.dart';
import 'package:aviator_delivery/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../blocs/cart_cubit/cart_cubit.dart';
import '../../../data/models/product_model.dart';

class OrderButtonWidget extends StatelessWidget {
  const OrderButtonWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: TextButton.icon(
            onPressed: () {
              context.read<CartCubit>().addProduct(productModel);
              final snackBar = SnackBar(
                content: const Text(
                  'Added to cart',
                  style: AppTextStyles.cartItemAmountStyle,
                  textAlign: TextAlign.center,
                ),
                backgroundColor: AppColors.itemAmountButtonColor,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 120.0, vertical: 20),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: SvgPicture.asset(
              'assets/icons/shopping-cart.svg',
              width: 24.0,
              height: 24.0,
              color: AppColors.buttonTextColor,
            ),
            label: const Text(
              'Order',
              style: AppTextStyles.textButtonStyle,
              textAlign: TextAlign.center,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.mainBackgroundColor),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.only(
                      top: 18, right: 100.5, bottom: 18, left: 99.5)),
              minimumSize: MaterialStateProperty.all<Size>(
                  Size(size.height * 0.3, size.width * 0.15)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
