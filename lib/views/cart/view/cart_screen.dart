import 'package:aviator_delivery/constants/app_text_styles.dart';
import 'package:aviator_delivery/views/cart/widgets/product_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../blocs/cart_cubit/cart_cubit.dart';
import '../../../blocs/cart_cubit/cart_state.dart';
import '../../../constants/app_colors.dart';
import '../../../util/app_routes.dart';
import '../../../widgets/buttons/chosen_action_button_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.buttonTextColor,
          elevation: 0,
          title: const Text(
            'My order',
            style: AppTextStyles.screenTitleStyle,
          ),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/21-san.svg',
                width: 24.0,
                height: 24.0,
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                AppRoutes.qrScreen,
              ),
            ),
          ],
        ),
        body: BlocBuilder<CartCubit, CartCubitState>(builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'You cart is empty',
                    style: AppTextStyles.itemCardTitleStyle,
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  const Text(
                    'Select the product you want to order in the "Categories" tab',
                    style: AppTextStyles.onBoardingScreenAccentStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            return Column(children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.cartItems.toSet().length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCartWidget(
                      productModel: state.cartItems.toSet().elementAt(index),
                    );
                  },
                ),
              ),
              ChosenActionButton(
                text: 'Confirm order',
                onTap: () {
                  final snackBar = SnackBar(
                    content: const Text(
                      'Order confirmed',
                      style: AppTextStyles.cartItemAmountStyle,
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: AppColors.itemAmountButtonColor,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.2,
                      vertical: 20,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Container(
                height: 66,
                color: AppColors.itemAmountButtonColor,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
                  child: Row(
                    children: [
                      const Text('Total amount:'),
                      const Spacer(),
                      Text(state.cartItems
                          .map((e) => double.parse(e.price))
                          .reduce((a, b) => a + b)
                          .roundToDouble()
                          .toString()),
                    ],
                  ),
                ),
              )
            ]);
          }
        }),
      ),
    );
  }
}
