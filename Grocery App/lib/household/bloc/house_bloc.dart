import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mohit_bloc_1/allcategories.dart';
import 'package:mohit_bloc_1/wishcart.dart';

part 'house_event.dart';
part 'house_state.dart';

class HouseBloc extends Bloc<HouseEvent, HouseState> {
  HouseBloc() : super(HouseInitial()) {
    on<AddtoWishlist>(_addToWishList);
    on<AddtoCartlist>(_addToCartList);
  }

  void _addToWishList(AddtoWishlist event, Emitter<HouseState> emit) {
    WishCartList.wishList.add(Allcategories.houseHold[event.houseIndex]);
    emit(HouseAddToWish());
  }

  void _addToCartList(AddtoCartlist event, Emitter<HouseState> emit) {
    WishCartList.cartList.add(Allcategories.houseHold[event.houseIndex]);
    emit(HouseAddToCart());
  }
}
