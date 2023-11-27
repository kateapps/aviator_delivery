import 'package:aviator_delivery/util/app_routes.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_text_styles.dart';
import '../../../data/models/product_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.type, required this.amount});

  final FoodType type;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed(AppRoutes.chosenCategory, arguments: type),
          radius: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  type.getPicture(),
                  fit: BoxFit.cover,
                  width: 160,
                  height: 125,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              type.name,
                              style: AppTextStyles.itemCardTitleStyle,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              '($amount)',
                              style: AppTextStyles.itemCardAmountStyle,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
