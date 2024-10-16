part of 'package_bloc.dart';

@immutable
sealed class PackageEvent {}

final class AddtoWishlist extends PackageEvent {
  int packageIndex;
  AddtoWishlist({required this.packageIndex});
}

final class AddtoCartlist extends PackageEvent {
  int packageIndex;
  AddtoCartlist({required this.packageIndex});
}
