import 'package:aviator_delivery/util/app_routes.dart';
import 'package:aviator_delivery/views/settings/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../blocs/cart_cubit/cart_cubit.dart';
import '../blocs/cart_cubit/cart_state.dart';
import '../constants/app_colors.dart';
import 'cart/view/cart_screen.dart';
import 'category/view/categories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> homeWidgets = [
    CategoriesScreen(),
    CartScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/grid.svg',
                width: 24.0,
                height: 24.0,
                color: currentIndex == 0 ? AppColors.mainBackgroundColor : null,
              ),
              label: AppRoutes.home),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                SvgPicture.asset(
                  'assets/icons/shopping-cart.svg',
                  width: 24.0,
                  height: 24.0,
                  color:
                      currentIndex == 1 ? AppColors.mainBackgroundColor : null,
                ),
                BlocBuilder<CartCubit, CartCubitState>(
                    builder: (context, state) {
                  if (state.cartItems.isEmpty) {
                    return SizedBox.shrink();
                  } else {
                    return Positioned(
                      left: 13,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: AppColors.cartAmountButtonColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Text(
                          state.cartItems.length.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/user.svg',
                width: 24.0,
                height: 24.0,
                color: currentIndex == 2 ? AppColors.mainBackgroundColor : null,
              ),
              label: AppRoutes.settings),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: AppColors.mainBackgroundColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
