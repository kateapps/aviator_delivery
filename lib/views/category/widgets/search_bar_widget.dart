import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../blocs/search_cubit/search_cubit.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: kToolbarHeight,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: "Search",
          filled: true,
          fillColor: Theme.of(context).cardColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 14.0,
              height: 14.0,
            ),
          ),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        onChanged: (value) => context.read<SearchCubit>().updateSearch(value),
      ),
    );
  }
}
