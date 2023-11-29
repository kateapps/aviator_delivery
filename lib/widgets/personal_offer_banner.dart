import 'package:aviator_delivery/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PersonalOfferBanner extends StatelessWidget {
  const PersonalOfferBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.height * 0.01),
      child: Container(
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
        width: size.width * 0.9,
        height: size.height * 0.17,
        child: Stack(
          children: [
            Column(children: [
              SizedBox(height: size.height * 0.015),
              Container(
                height: size.height * 0.03,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.buttonTextColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    size.width * 0.003,
                  ),
                  child: Text(
                    '-15%',
                    style: AppTextStyles.idNumber,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.015),
              Padding(
                padding: EdgeInsets.all(size.height * 0.01),
                child: const Text(
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
                width: size.width * 0.5,
                height: size.height * 0.17,
              ),
            )
          ],
        ),
      ),
    );
  }
}
