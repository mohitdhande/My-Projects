part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class CategoriesViewAll extends HomeEvent {}

final class HGoIntocategories extends HomeEvent {
  int index;
  HGoIntocategories({required this.index});
}

final class DHome extends HomeEvent {}

final class DMyOrders extends HomeEvent {}

final class DtrackOrders extends HomeEvent {}

final class Dprofile extends HomeEvent {}

final class Doffers extends HomeEvent {}

final class Dnotify extends HomeEvent {}

final class Dhelp extends HomeEvent {}

final class Dprivacy extends HomeEvent {}

final class DAbout extends HomeEvent {}

final class DLogout extends HomeEvent {}

final class DSettings extends HomeEvent {}

final class DWishlist extends HomeEvent {}

final class DCartlist extends HomeEvent {}
