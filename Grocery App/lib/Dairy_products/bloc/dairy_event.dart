part of 'dairy_bloc.dart';

@immutable
sealed class DairyEvent {}

final class AddtoWishlist extends DairyEvent {
  int dairyIndex;
  AddtoWishlist({required this.dairyIndex});
}

final class AddtoCartlist extends DairyEvent {
  int dairyIndex;
  AddtoCartlist({required this.dairyIndex});
}
