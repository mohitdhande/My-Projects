part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class OnCategoriesPage extends HomeState {}

final class HVegetableList extends HomeState {}

final class HFruitList extends HomeState {}

final class HDairyproductList extends HomeState {}

final class HCookingList extends HomeState {}

final class OnDHome extends HomeState {}

final class OnMyOrders extends HomeState {}

final class OnProfile extends HomeState {}

final class OntrackOrders extends HomeState {}

final class OnOffers extends HomeState {}

final class OnNotify extends HomeState {}

final class OnHelp extends HomeState {}

final class OnPrivacy extends HomeState {}

final class OnAboutUs extends HomeState {}

final class OnLogout extends HomeState {}

final class OnSettings extends HomeState {}

final class OnWish extends HomeState {}

final class OnWCart extends HomeState {}
