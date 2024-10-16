import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mohit_bloc_1/allcategories.dart';
import 'package:mohit_bloc_1/wishcart.dart';

part 'cooking_event.dart';
part 'cooking_state.dart';

class CookingBloc extends Bloc<CookingEvent, CookingState> {
  CookingBloc() : super(CookingInitial()) {
    on<CAddtoWishlist>(_addToWishList);
    on<CAddtoCartlist>(_addToCartList);
  }

  void _addToWishList(CAddtoWishlist event, Emitter<CookingState> emit) {
    WishCartList.wishList.add(Allcategories.cooking[event.cookingIndex]);
    emit(CookingAddToWish());
  }

  void _addToCartList(CAddtoCartlist event, Emitter<CookingState> emit) {
    WishCartList.cartList.add(Allcategories.cooking[event.cookingIndex]);
    emit(CookingAddToCart());
  }
}
