import 'package:aviator_delivery/constants/app_text_styles.dart';
import 'package:aviator_delivery/util/app_routes.dart';
import 'package:aviator_delivery/views/category/widgets/order_icon_button.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/product_model.dart';

class ProductMenuWidget extends StatelessWidget {
  const ProductMenuWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.product,
          arguments: productModel),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FancyShimmerImage(
                height: 127,
                width: 157,
                boxDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                boxFit: BoxFit.cover,
                imageUrl: productModel.picture,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productModel.name,
                      style: AppTextStyles.cartItemPriceStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productModel.price,
                          style: AppTextStyles.screenTitleStyle),
                      OrderIconButton(
                        productModel: productModel,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
