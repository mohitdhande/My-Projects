part of 'snacks_bloc.dart';

@immutable
sealed class SnacksState {}

final class SnacksInitial extends SnacksState {}

final class SnacksAddToWish extends SnacksState {}

final class SnacksAddToCart extends SnacksState {}
