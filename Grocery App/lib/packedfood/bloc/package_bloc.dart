import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mohit_bloc_1/allcategories.dart';
import 'package:mohit_bloc_1/wishcart.dart';

part 'package_event.dart';
part 'package_state.dart';

class PackageBloc extends Bloc<PackageEvent, PackageState> {
  PackageBloc() : super(PackageInitial()) {
    on<AddtoWishlist>(_addToWishList);
    on<AddtoCartlist>(_addToCartList);
  }
  void _addToWishList(AddtoWishlist event, Emitter<PackageState> emit) {
    WishCartList.wishList.add(Allcategories.snacks[event.packageIndex]);
    emit(PackageAddToWish());
  }

  void _addToCartList(AddtoCartlist event, Emitter<PackageState> emit) {
    WishCartList.cartList.add(Allcategories.packagefood[event.packageIndex]);
    emit(PackageAddToCart());
  }
}
