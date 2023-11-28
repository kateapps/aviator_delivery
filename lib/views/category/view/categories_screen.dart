import 'package:aviator_delivery/constants/app_colors.dart';
import 'package:aviator_delivery/constants/app_text_styles.dart';

import 'package:aviator_delivery/views/category/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../blocs/products_bloc/products_bloc.dart';
import '../../../blocs/products_bloc/products_state.dart';
import '../../../blocs/search_cubit/search_cubit.dart';
import '../../../blocs/search_cubit/search_state.dart';
import '../../../data/models/product_model.dart';
import '../../../util/app_routes.dart';
import '../../../widgets/personal_offer_banner.dart';
import '../widgets/search_bar_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.buttonTextColor,
        elevation: 0,
        title: const Text(
          'Category',
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
        children: [
          const SearchBarWidget(),
          const SizedBox(
            height: 20,
          ),
          const PersonalOfferBanner(),
          Expanded(
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HasDataState) {
                  Map<FoodType, int> categoriesCount = {};
                  for (var item in state.itemList) {
                    if (categoriesCount[item.foodType] == null) {
                      categoriesCount[item.foodType] = 1;
                    } else {
                      categoriesCount[item.foodType] =
                          categoriesCount[item.foodType]! + 1;
                    }
                  }

                  return BlocBuilder<SearchCubit, SearchCubitState>(
                    builder: (context, state) {
                      var filteredCategories = FoodType.values.where((e) => e
                          .name
                          .toLowerCase()
                          .contains(state.search.toLowerCase()));
                      return GridView.count(
                        crossAxisCount: 2,
                        children: [
                          for (var type in filteredCategories)
                            CategoryWidget(
                              type: type,
                              amount: categoriesCount[type]!,
                            )
                        ],
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
