part of 'cooking_bloc.dart';

@immutable
sealed class CookingEvent {}

final class CAddtoWishlist extends CookingEvent {
  int cookingIndex;
  CAddtoWishlist({required this.cookingIndex});
}

final class CAddtoCartlist extends CookingEvent {
  int cookingIndex;
  CAddtoCartlist({required this.cookingIndex});
}
