part of 'cooking_bloc.dart';

@immutable
sealed class CookingState {}

final class CookingInitial extends CookingState {}

final class CookingAddToWish extends CookingState {}

final class CookingAddToCart extends CookingState {}
