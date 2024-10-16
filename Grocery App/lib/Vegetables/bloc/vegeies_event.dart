part of 'vegeies_bloc.dart';

@immutable
sealed class VegeiesEvent {}

final class AddtoWishlist extends VegeiesEvent {
  int vegIndex;
  AddtoWishlist({required this.vegIndex});
}

final class AddtoCartlist extends VegeiesEvent {
  int vegIndex;
  AddtoCartlist({required this.vegIndex});
}
