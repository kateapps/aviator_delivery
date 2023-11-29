import 'package:aviator_delivery/views/cart/widgets/item_amount_cart_button.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../blocs/cart_cubit/cart_cubit.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../data/models/product_model.dart';

class ProductCartWidget extends StatelessWidget {
  const ProductCartWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.18,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.02,
          horizontal: screenSize.width * 0.04),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.itemAmountButtonColor,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: FancyShimmerImage(
              height: screenSize.height * 0.3,
              width: screenSize.width * 0.4,
              boxFit: BoxFit.cover,
              imageUrl: productModel.picture,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      productModel.name,
                      style: AppTextStyles.cartItemTitleStyle,
                    )),
                    GestureDetector(
                      onTap: () =>
                          context.read<CartCubit>().removeProduct(productModel),
                      child: CircleAvatar(
                        backgroundColor: AppColors.itemAmountButtonColor,
                        radius: 9.5,
                        child: SvgPicture.asset(
                          'assets/icons/x.svg',
                          width: 12,
                          height: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  productModel.price,
                  style: AppTextStyles.cartItemPriceStyle,
                ),
                const Spacer(),
                ItemAmountCartButton(
                  productModel: productModel,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
