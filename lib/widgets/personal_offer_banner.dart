import 'package:aviator_delivery/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PersonalOfferBanner extends StatelessWidget {
  const PersonalOfferBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(25),
        color: AppColors.mainBackgroundColor,
      ),
      width: 360,
      height: 126,
      child: Stack(
        children: [
          Column(children: [
            const SizedBox(height: 15),
            Container(
              height: 25,
              width: 74,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.buttonTextColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '-15%',
                  style: AppTextStyles.idNumber,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Special offer\n for you!',
                style: AppTextStyles.personalBannerStyle,
                // textAlign: TextAlign.center,
              ),
            )
          ]),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              'assets/offers_banner.png',
              fit: BoxFit.cover,
              width: 160,
              height: 125,
            ),
          )
        ],
      ),
    );
  }
}
