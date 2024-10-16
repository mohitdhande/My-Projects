part of 'vegeies_bloc.dart';

@immutable
sealed class VegeiesState {}

final class VegeiesInitial extends VegeiesState {}

final class VeggiesAddToWish extends VegeiesState {}

final class VeggiesAddToCart extends VegeiesState {}
