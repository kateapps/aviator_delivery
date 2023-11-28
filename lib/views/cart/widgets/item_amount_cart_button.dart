import 'package:aviator_delivery/constants/app_colors.dart';
import 'package:aviator_delivery/constants/app_text_styles.dart';
import 'package:aviator_delivery/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../blocs/cart_cubit/cart_cubit.dart';
import '../../../blocs/cart_cubit/cart_state.dart';

class ItemAmountCartButton extends StatelessWidget {
  const ItemAmountCartButton({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartCubitState>(
      builder: (context, state) {
        int amount = state.cartItems.where((e) => e == productModel).length;
        return Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => context
                  .read<CartCubit>()
                  .removeAllSimilarProduct(productModel),
              child: CircleAvatar(
                backgroundColor: AppColors.itemAmountButtonColor,
                radius: 11,
                child: SvgPicture.asset(
                  'assets/icons/minus.svg',
                  width: 10.0,
                  height: 10.0,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              '$amount',
              style: AppTextStyles
                  .cartItemAmountStyle, // Adjust the font size as needed
            ),
            const SizedBox(
              width: 16,
            ),
            // Plus button
            GestureDetector(
              onTap: () => context.read<CartCubit>().addProduct(productModel),
              child: CircleAvatar(
                backgroundColor: AppColors.itemAmountButtonColor,
                radius: 11, // Adjust the size of the circle as needed
                child: SvgPicture.asset(
                  'assets/icons/plus.svg',
                  width: 10.0,
                  height: 10.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
