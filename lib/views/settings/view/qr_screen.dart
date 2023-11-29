import 'package:aviator_delivery/widgets/buttons/chosen_action_button_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class QRScreen extends StatelessWidget {
  final int qrData = Random().nextInt(9999);

  QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.buttonTextColor,
          elevation: 0,
          title: const Text(
            'QR Screen',
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/maximize-4.svg',
                width: 24.0,
                height: 24.0,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/rotate-right.svg',
                width: 24.0,
                height: 24.0,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            const Text(
              'Personal bonus card',
              style: AppTextStyles.menuItemDescriptionStyle,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              qrData.toString(),
              style: AppTextStyles.idNumber,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Center(
              child: QrImageView(
                data: qrData.toString(),
                version: QrVersions.auto,
                size: size.height * 0.3,
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            const Text(
              'Scan the QR code to get your bonus points',
              style: AppTextStyles.menuItemDescriptionStyle,
            ),
            const Spacer(),
            ChosenActionButton(text: 'My personal offers', onTap: () {}),
            SizedBox(
              height: size.width * 0.08,
            ),
          ],
        ));
  }
}
