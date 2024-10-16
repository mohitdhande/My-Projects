import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mohit_bloc_1/Vegetables/vegetable.dart';
import 'package:mohit_bloc_1/allcategories.dart';
import 'package:mohit_bloc_1/wishcart.dart';

part 'vegeies_event.dart';
part 'vegeies_state.dart';

class VegeiesBloc extends Bloc<VegeiesEvent, VegeiesState> {
  VegeiesBloc() : super(VegeiesInitial()) {
    on<AddtoWishlist>(_addToWishList);
    on<AddtoCartlist>(_addToCartList);
  }

  void _addToWishList(AddtoWishlist event, Emitter<VegeiesState> emit) {
    WishCartList.wishList.add(Allcategories.vegies[event.vegIndex]);
    emit(VeggiesAddToWish());
  }

  void _addToCartList(AddtoCartlist event, Emitter<VegeiesState> emit) {
    WishCartList.cartList.add(Allcategories.vegies[event.vegIndex]);
    emit(VeggiesAddToCart());
  }
}
