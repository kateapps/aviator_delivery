import 'package:bloc/bloc.dart';

import '../../data/models/product_model.dart';
import '../../data/repository/product_repository.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this.productRepository) : super(LoadingState()) {
    on<FetchDataEvent>(_onFetchData);
  }

  final ProductRepository productRepository;

  Future<void> _onFetchData(
      FetchDataEvent event, Emitter<ProductsState> emit) async {
    emit(LoadingState());
    List<ProductModel> itemList = await productRepository.fetchData();
    emit(HasDataState(itemList));
  }
}
