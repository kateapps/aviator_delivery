import 'package:aviator_delivery/blocs/onboarding/onboarding_cubit.dart';
import 'package:aviator_delivery/data/models/product_model.dart';
import 'package:aviator_delivery/data/repository/cart_repository.dart';
import 'package:aviator_delivery/data/repository/onboarding_repository.dart';
import 'package:aviator_delivery/views/category/view/chosen_category_screen.dart';
import 'package:aviator_delivery/views/category/view/product_screen.dart';
import 'package:aviator_delivery/views/settings/view/about_restaurant_screen.dart';
import 'package:aviator_delivery/views/settings/view/my_bonuses_screen.dart';
import 'package:aviator_delivery/views/settings/view/qr_screen.dart';
import 'package:aviator_delivery/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_cubit/cart_cubit.dart';
import '../blocs/products_bloc/products_bloc.dart';
import '../blocs/products_bloc/products_event.dart';
import '../blocs/search_cubit/search_cubit.dart';
import '../data/repository/product_repository.dart';
import '../views/home_screen.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const welcome = 'welcome';
  static const categories = 'categories';
  static const chosenCategory = 'chosenCategory';
  static const product = 'product';
  static const cart = 'cart';
  static const qrScreen = 'qrScreen';
  static const settings = 'settings';
  static const myBonuses = 'myBonuses';
  static const aboutRestaurant = 'aboutRestaurant';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final Widget child;

    ProductRepository productRepo = ProductRepository();
    ProductsBloc productsBloc = ProductsBloc(productRepo)
      ..add(FetchDataEvent());

    CartRepository cartRepo = CartRepository();
    CartCubit cartCubit = CartCubit(cartRepo);
    OnboardingRepository onboardingRepository = OnboardingRepository();
    OnboardingCubit onboardingCubit = OnboardingCubit(onboardingRepository);

    switch (settings.name) {
      case home:
        child = MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => productsBloc),
            BlocProvider<CartCubit>(
              create: (_) => cartCubit,
            ),
            BlocProvider<SearchCubit>(
              create: (_) => SearchCubit(),
            )
          ],
          child: const HomeScreen(),
        );
      case chosenCategory:
        FoodType foodType = settings.arguments as FoodType;
        child = MultiBlocProvider(
          providers: [
            BlocProvider<ProductsBloc>(
              create: (_) => productsBloc,
            ),
            BlocProvider<CartCubit>(
              create: (_) => cartCubit,
            ),
            BlocProvider<SearchCubit>(
              create: (_) => SearchCubit(),
            )
          ],
          child: ChosenCategoryScreen(type: foodType),
        );
      case product:
        ProductModel productModel = settings.arguments as ProductModel;
        child = BlocProvider(
          create: (context) => cartCubit,
          child: ProductScreen(productModel: productModel),
        );
      case qrScreen:
        child = QRScreen();
      case myBonuses:
        child = const MyBonusesScreen();
      case aboutRestaurant:
        child = const AboutRestaurantScreen();

      default:
        child = BlocProvider(
          create: (context) => onboardingCubit,
          child: const OnboardingScreen(),
        );
    }
    return MaterialPageRoute(builder: (_) => child);
  }
}
