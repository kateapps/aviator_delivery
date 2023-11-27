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
    return Row(
      children: [
        Expanded(
          child: TextButton.icon(
            onPressed: () => context.read<CartCubit>().addProduct(productModel),
            icon: SvgPicture.asset(
              'assets/icons/shopping-cart.svg',
              width: 24.0,
              height: 24.0,
              color: AppColors.buttonTextColor,
            ),
            label: Text(
              'Order',
              style: AppTextStyles.textButtonStyle,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.mainBackgroundColor),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.only(
                      top: 18, right: 100.5, bottom: 18, left: 99.5)),
              minimumSize: MaterialStateProperty.all<Size>(const Size(297, 56)),
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
