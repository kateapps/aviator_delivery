import 'package:aviator_delivery/views/cart/widgets/item_amount_cart_button.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../blocs/cart_cubit/cart_cubit.dart';
import '../../../constants/app_colors.dart';
import '../../../data/models/product_model.dart';

class ProductCartWidget extends StatelessWidget {
  const ProductCartWidget({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 128,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: FancyShimmerImage(
              height: 128,
              width: 157,
              boxFit: BoxFit.cover,
              imageUrl: productModel.picture,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(productModel.name)),
                    GestureDetector(
                      onTap: () =>
                          context.read<CartCubit>().removeProduct(productModel),
                      child: CircleAvatar(
                        backgroundColor: AppColors.itemAmountButtonColor,
                        radius: 9.5,
                        child: SvgPicture.asset(
                          'assets/icons/x.svg',
                          width: 6.33,
                          height: 6.33,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(productModel.price),
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
