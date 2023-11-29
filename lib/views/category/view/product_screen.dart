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
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
            SizedBox(
              height: size.width * 0.05,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productModel.name,
                      style: AppTextStyles.menuItemScreenTitleStyle,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.productModel.price,
                          style: AppTextStyles.menuItemScreenPriceStyle,
                        ),
                        const Spacer(),
                        Container(
                          width: size.width * 0.3,
                          height: size.width * 0.1,
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
                    SizedBox(
                      height: size.width * 0.1,
                    ),
                    const Divider(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(widget.productModel.description,
                            style: AppTextStyles.menuItemDescriptionStyle),
                      ),
                    ),
                    OrderButtonWidget(
                      productModel: widget.productModel,
                    ),
                    SizedBox(
                      height: size.width * 0.04,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
