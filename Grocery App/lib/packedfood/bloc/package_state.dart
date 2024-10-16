part of 'package_bloc.dart';

@immutable
sealed class PackageState {}

final class PackageInitial extends PackageState {}

final class PackageAddToWish extends PackageState {}

final class PackageAddToCart extends PackageState {}
