import 'package:aviator_delivery/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../blocs/cart_cubit/cart_cubit.dart';
import '../../../blocs/cart_cubit/cart_state.dart';
import '../../../data/models/product_model.dart';
import '../../../util/app_routes.dart';

class OrderIconButton extends StatelessWidget {
  const OrderIconButton({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartCubitState>(
      builder: (context, state) {
        return SizedBox(
          width: 78,
          height: 45,
          child: ElevatedButton(
            onPressed: () => context.read<CartCubit>().addProduct(productModel),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainBackgroundColor,
              padding: const EdgeInsets.fromLTRB(12, 0, 13, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Border radius
              ),
            ),
            child: SvgPicture.asset(
              'assets/icons/shopping-cart.svg',
              width: 24.0,
              height: 24.0,
              color: AppColors.buttonTextColor,
            ),
          ),
        );
      },
    );
  }
}