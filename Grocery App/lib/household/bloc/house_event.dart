part of 'house_bloc.dart';

@immutable
sealed class HouseEvent {}

final class AddtoWishlist extends HouseEvent {
  int houseIndex;
  AddtoWishlist({required this.houseIndex});
}

final class AddtoCartlist extends HouseEvent {
  int houseIndex;
  AddtoCartlist({required this.houseIndex});
}
