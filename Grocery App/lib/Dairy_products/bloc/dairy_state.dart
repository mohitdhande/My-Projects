part of 'dairy_bloc.dart';

@immutable
sealed class DairyState {}

final class DairyInitial extends DairyState {}

final class DairyAddToWish extends DairyState {}

final class DairyAddToCart extends DairyState {}
