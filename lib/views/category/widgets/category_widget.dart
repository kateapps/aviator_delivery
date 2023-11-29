import 'package:aviator_delivery/util/app_routes.dart';

import 'package:flutter/material.dart';

import '../../../constants/app_text_styles.dart';
import '../../../data/models/product_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.type, required this.amount});

  final FoodType type;
  final int amount;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.005),
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
              SizedBox(height: screenSize.width * 0.03),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  type.getPicture(),
                  fit: BoxFit.cover,
                  width: screenSize.width * 0.4,
                  height: screenSize.height * 0.15,
                ),
              ),
              SizedBox(height: screenSize.height * 0.01),
              Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.001),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: screenSize.height * 0.01),
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
                        padding:
                            EdgeInsets.only(left: screenSize.height * 0.01),
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
