part of 'snacks_bloc.dart';

@immutable
sealed class SnacksEvent {}

final class AddtoWishlist extends SnacksEvent {
  int snacksIndex;
  AddtoWishlist({required this.snacksIndex});
}

final class AddtoCartlist extends SnacksEvent {
  int snacksIndex;
  AddtoCartlist({required this.snacksIndex});
}
