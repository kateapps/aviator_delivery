import 'package:aviator_delivery/constants/app_colors.dart';
import 'package:aviator_delivery/constants/app_text_styles.dart';

import 'package:aviator_delivery/views/category/widgets/order_button_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/models/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/chevron-left.svg',
            width: 24.0,
            height: 24.0,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FancyShimmerImage(
            width: double.infinity,
            boxFit: BoxFit.cover,
            imageUrl: widget.productModel.picture,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productModel.name,
                    style: AppTextStyles.menuItemScreenTitleStyle,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.productModel.price,
                        style: AppTextStyles.menuItemScreenPriceStyle,
                      ),
                      const Spacer(),
                      Container(
                        width: 106.0,
                        height: 35.0,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: AppColors.accentButtonColor,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: const Center(
                          child: Text('~ 600 gr/piece',
                              style: AppTextStyles
                                  .menuItemScreenAccentButtonStyle),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(widget.productModel.description,
                          style: AppTextStyles.menuItemDescriptionStyle),
                    ),
                  ),
                  OrderButtonWidget(
                    productModel: widget.productModel,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
