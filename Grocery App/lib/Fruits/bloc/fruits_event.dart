part of 'fruits_bloc.dart';

@immutable
sealed class FruitsEvent {}

final class AddtoWishlist extends FruitsEvent {
  int fruitIndex;
  AddtoWishlist({required this.fruitIndex});
}

final class AddtoCartlist extends FruitsEvent {
  int fruitIndex;
  AddtoCartlist({required this.fruitIndex});
}
