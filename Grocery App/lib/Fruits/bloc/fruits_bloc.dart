import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mohit_bloc_1/allcategories.dart';
import 'package:mohit_bloc_1/wishcart.dart';

part 'fruits_event.dart';
part 'fruits_state.dart';

class FruitsBloc extends Bloc<FruitsEvent, FruitsState> {
  FruitsBloc() : super(FruitsInitial()) {
    on<AddtoWishlist>(_addToWishList);
    on<AddtoCartlist>(_addToCartList);
  }

  void _addToWishList(AddtoWishlist event, Emitter<FruitsState> emit) {
    WishCartList.wishList.add(Allcategories.fruties[event.fruitIndex]);
    emit(FruitAddToWish());
  }

  void _addToCartList(AddtoCartlist event, Emitter<FruitsState> emit) {
    WishCartList.cartList.add(Allcategories.fruties[event.fruitIndex]);
    emit(FruitAddToCart());
  }
}
