part of 'bev_bloc.dart';

@immutable
sealed class BevState {}

final class BevInitial extends BevState {}

final class BevAddToWish extends BevState {}

final class BevAddToCart extends BevState {}
