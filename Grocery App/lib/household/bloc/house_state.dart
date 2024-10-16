part of 'house_bloc.dart';

@immutable
sealed class HouseState {}

final class HouseInitial extends HouseState {}

final class HouseAddToWish extends HouseState {}

final class HouseAddToCart extends HouseState {}
