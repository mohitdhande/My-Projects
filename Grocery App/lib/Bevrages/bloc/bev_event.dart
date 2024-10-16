part of 'bev_bloc.dart';

@immutable
sealed class BevEvent {}

final class AddtoWishlist extends BevEvent {
  int bevindex;
  AddtoWishlist({required this.bevindex});
}

final class AddtoCartlist extends BevEvent {
  int bevindex;
  AddtoCartlist({required this.bevindex});
}
