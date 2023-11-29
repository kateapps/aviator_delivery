import 'package:aviator_delivery/widgets/buttons/chosen_action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../util/app_routes.dart';

class MyBonusesScreen extends StatelessWidget {
  const MyBonusesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttonTextColor,
        elevation: 0,
        title: const Text(
          'My bonuses',
          style: AppTextStyles.screenTitleStyle,
        ),
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
        children: [
          SizedBox(
            height: size.width * 0.05,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Amount of bonus points',
                  style: AppTextStyles.menuItemDescriptionStyle,
                ),
                Spacer(),
                Text(
                  '15.13',
                  style: AppTextStyles.menuItemScreenPriceStyle,
                )
              ],
            ),
          ),
          const Spacer(),
          ChosenActionButton(
              text: 'Scan QR',
              onTap: () => Navigator.pushNamed(context, AppRoutes.qrScreen)),
          SizedBox(
            height: size.width * 0.08,
          ),
        ],
      ),
    );
  }
}
