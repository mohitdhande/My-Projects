part of 'categories_bloc.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class VegetableList extends CategoriesState {}

final class CFruitsList extends CategoriesState {}

final class DairyProductsList extends CategoriesState {}

final class CookingEssentialsList extends CategoriesState {}

final class SnacksList extends CategoriesState {}

final class BeveragesList extends CategoriesState {}

final class PackageFoodList extends CategoriesState {}

final class HouseHoldList extends CategoriesState {}
