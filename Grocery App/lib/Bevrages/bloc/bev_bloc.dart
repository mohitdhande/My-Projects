import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mohit_bloc_1/allcategories.dart';
import 'package:mohit_bloc_1/wishcart.dart';

part 'bev_event.dart';
part 'bev_state.dart';

class BevBloc extends Bloc<BevEvent, BevState> {
  BevBloc() : super(BevInitial()) {
    on<AddtoWishlist>(_addToWishList);
    on<AddtoCartlist>(_addToCartList);
  }
  void _addToWishList(AddtoWishlist event, Emitter<BevState> emit) {
    WishCartList.wishList.add(Allcategories.bev[event.bevindex]);
    emit(BevAddToWish());
  }

  void _addToCartList(AddtoCartlist event, Emitter<BevState> emit) {
    WishCartList.cartList.add(Allcategories.bev[event.bevindex]);
    emit(BevAddToCart());
  }
}
