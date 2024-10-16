part of 'fruits_bloc.dart';

@immutable
sealed class FruitsState {}

final class FruitsInitial extends FruitsState {}

final class FruitAddToWish extends FruitsState {}

final class FruitAddToCart extends FruitsState {}
