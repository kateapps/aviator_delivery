import 'package:bloc/bloc.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit() : super(SearchCubitState(''));

  void updateSearch(String search) {
    emit(SearchCubitState(search));
  }
}
