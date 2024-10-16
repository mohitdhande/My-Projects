import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mohit_bloc_1/allcategories.dart';
import 'package:mohit_bloc_1/wishcart.dart';

part 'snacks_event.dart';
part 'snacks_state.dart';

class SnacksBloc extends Bloc<SnacksEvent, SnacksState> {
  SnacksBloc() : super(SnacksInitial()) {
    on<AddtoWishlist>(_addToWishList);
    on<AddtoCartlist>(_addToCartList);
  }
  void _addToWishList(AddtoWishlist event, Emitter<SnacksState> emit) {
    WishCartList.wishList.add(Allcategories.snacks[event.snacksIndex]);
    emit(SnacksAddToWish());
  }

  void _addToCartList(AddtoCartlist event, Emitter<SnacksState> emit) {
    WishCartList.cartList.add(Allcategories.snacks[event.snacksIndex]);
    emit(SnacksAddToCart());
  }
}
