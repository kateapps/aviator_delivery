import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_text_styles.dart';

class AboutRestaurantScreen extends StatelessWidget {
  const AboutRestaurantScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          Expanded(
            child: FancyShimmerImage(
              width: double.infinity,
              boxFit: BoxFit.cover,
              imageUrl:
                  'https://www.eatingwell.com/thmb/deD2xmEF1ijuavPNlzjtbhGhdiY=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4027937-0d71415ef05c4bd09ac7d6594be3a42d.jpg',
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.04),
            child: Container(
              height: size.height * 0.65,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aviator Delivery Takes Flight: Elevating Your Culinary Experience',
                    style: AppTextStyles.itemCardTitleStyle,
                  ),
                  Text(
                    'In the fast-paced world of food delivery, Aviator Delivery stands out as a beacon of culinary excellence, offering a diverse range of options from pizzas and sushi to burgers and salads. As a premier delivery service, Aviator Delivery has successfully taken the hassle out of dining, providing customers with a one-stop destination for their favorite culinary delights.',
                    style: AppTextStyles.restaurantDescriptionStyle,
                  ),
                  Text('A Culinary Adventure in Every Bite!',
                      style: AppTextStyles.itemCardTitleStyle),
                  Text(
                    'Aviator Delivery understands the value of time, and our user-friendly platform ensures a seamless ordering experience. Whether you are craving a pizza feast, sushi indulgence, burger delight, or a healthy salad option, Aviator Delivery is just a click away, ready to take your taste buds on a journey.',
                    style: AppTextStyles.restaurantDescriptionStyle,
                  ),
                  Text(
                    'Delivery is your trusted partner in elevating your dining experience. With a commitment to quality, variety, and swift service, Aviator Delivery is more than a delivery service – it is a culinary adventure delivered to your door',
                    style: AppTextStyles.restaurantDescriptionStyle,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
