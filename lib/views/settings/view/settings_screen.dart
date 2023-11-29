import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../util/app_routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  Future<void> _launchURL() async {
    Uri url = Uri.parse('https://google.com/');
    if (await canLaunchUrl(url)) {
      final bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        throw 'Could not launch $url';
      }
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttonTextColor,
        elevation: 0,
        title: const Text(
          'Settings',
          style: AppTextStyles.screenTitleStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/21-san.svg',
              width: 24.0,
              height: 24.0,
            ),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.qrScreen),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: ListTile(
              title: TextButton.icon(
                icon: SvgPicture.asset(
                  'assets/icons/shield.svg',
                  width: 24.0,
                  height: 24.0,
                  color: AppColors.mainTextColor,
                ),
                style: const ButtonStyle(alignment: Alignment.centerLeft),
                onPressed: _launchURL,
                label: const Text(
                  'Privacy Policy',
                  style: AppTextStyles.itemCardTitleStyle,
                ),
              ),
            ),
          ),
          ListTile(
            title: TextButton.icon(
              icon: SvgPicture.asset(
                'assets/icons/document-text.svg',
                width: 24.0,
                height: 24.0,
                color: AppColors.mainTextColor,
              ),
              style: const ButtonStyle(alignment: Alignment.centerLeft),
              onPressed: _launchURL,
              label: const Text(
                'Terms of Use',
                style: AppTextStyles.itemCardTitleStyle,
              ),
            ),
          ),
          ListTile(
            title: TextButton.icon(
              icon: SvgPicture.asset(
                'assets/icons/heart.svg',
                width: 24.0,
                height: 24.0,
                color: AppColors.mainTextColor,
              ),
              style: const ButtonStyle(alignment: Alignment.centerLeft),
              onPressed: () {},
              label: const Text(
                'Rate our app in the AppStore',
                style: AppTextStyles.itemCardTitleStyle,
              ),
            ),
          ),
          ListTile(
            title: TextButton.icon(
              icon: SvgPicture.asset(
                'assets/icons/21-san.svg',
                width: 24.0,
                height: 24.0,
                color: AppColors.mainTextColor,
              ),
              style: const ButtonStyle(alignment: Alignment.centerLeft),
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.myBonuses),
              label: const Text(
                'My bonuses',
                style: AppTextStyles.itemCardTitleStyle,
              ),
            ),
          ),
          ListTile(
            title: TextButton.icon(
              icon: SvgPicture.asset(
                'assets/icons/coffee.svg',
                width: 24.0,
                height: 24.0,
                color: AppColors.mainTextColor,
              ),
              style: const ButtonStyle(alignment: Alignment.centerLeft),
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.aboutRestaurant,
              ),
              label: const Text(
                'About our restaurant',
                style: AppTextStyles.itemCardTitleStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
