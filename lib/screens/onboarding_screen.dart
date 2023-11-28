import 'package:aviator_delivery/blocs/onboarding/onboarding_cubit.dart';
import 'package:aviator_delivery/constants/app_text_styles.dart';
import 'package:aviator_delivery/util/app_routes.dart';
import 'package:aviator_delivery/widgets/buttons/chosen_action_button_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key, this.isFirstTime});
  final isFirstTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FancyShimmerImage(
            width: double.infinity,
            height: 575,
            boxFit: BoxFit.cover,
            imageUrl:
                'https://www.eatingwell.com/thmb/deD2xmEF1ijuavPNlzjtbhGhdiY=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4027937-0d71415ef05c4bd09ac7d6594be3a42d.jpg',
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(17, 0, 17, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
            ),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.vertical,
              children: [
                const Text(
                  'Exclusive Deals and Discounts,',
                  style: AppTextStyles.cartItemAmountStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Enjoy exclusive deals and discounts from your favourite restaurant',
                  style: AppTextStyles.cartItemPriceStyle,
                  textAlign: TextAlign.center,
                ),
                ChosenActionButton(
                    text: 'Continue',
                    onTap: () async {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                      context.read<OnboardingCubit>().setFirstTime();
                    }),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'By clicking to the "Continue" button, you agree to our Term of use and Privacy Policy Restore',
                  style: AppTextStyles.onBoardingScreenAccentStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
