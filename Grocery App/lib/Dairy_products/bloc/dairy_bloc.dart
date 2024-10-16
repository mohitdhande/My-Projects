import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mohit_bloc_1/allcategories.dart';
import 'package:mohit_bloc_1/wishcart.dart';

part 'dairy_event.dart';
part 'dairy_state.dart';

class DairyBloc extends Bloc<DairyEvent, DairyState> {
  DairyBloc() : super(DairyInitial()) {
    on<AddtoWishlist>(_addToWishList);
    on<AddtoCartlist>(_addToCartList);
  }

  void _addToWishList(AddtoWishlist event, Emitter<DairyState> emit) {
    WishCartList.wishList.add(Allcategories.dairy[event.dairyIndex]);
    emit(DairyAddToWish());
  }

  void _addToCartList(AddtoCartlist event, Emitter<DairyState> emit) {
    WishCartList.cartList.add(Allcategories.dairy[event.dairyIndex]);
    emit(DairyAddToCart());
  }
}
