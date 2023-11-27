import 'package:aviator_delivery/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../blocs/products_bloc/products_bloc.dart';
import '../../../blocs/products_bloc/products_state.dart';
import '../../../blocs/search_cubit/search_cubit.dart';
import '../../../blocs/search_cubit/search_state.dart';
import '../../../constants/app_colors.dart';
import '../../../data/models/product_model.dart';
import '../widgets/product_menu_widget.dart';
import '../widgets/search_bar_widget.dart';

class ChosenCategoryScreen extends StatefulWidget {
  const ChosenCategoryScreen({super.key, required this.type});

  final FoodType type;

  @override
  State<ChosenCategoryScreen> createState() => _ChosenCategoryScreenState();
}

class _ChosenCategoryScreenState extends State<ChosenCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttonTextColor,
        elevation: 0,
        title: Text(
          widget.type.name,
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
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HasDataState) {
            List<ProductModel> chosenCategoryItems =
                state.itemList.where((e) => e.foodType == widget.type).toList();
            return Column(
              children: [
                SearchBarWidget(),
                Expanded(child: BlocBuilder<SearchCubit, SearchCubitState>(
                  builder: (context, state) {
                    var filteredItems = chosenCategoryItems.where((e) => e.name
                        .toLowerCase()
                        .contains(state.search.toLowerCase()));
                    return ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductMenuWidget(
                            productModel: filteredItems.elementAt(index));
                      },
                    );
                  },
                )),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
