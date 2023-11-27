import 'package:bloc/bloc.dart';

import '../../data/models/product_model.dart';
import '../cart_cubit/cart_state.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit() : super(SearchCubitState(''));

  void updateSearch(String search) {
    emit(SearchCubitState(search));
  }
}
