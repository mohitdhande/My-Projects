part of 'categories_bloc.dart';

@immutable
sealed class CategoriesEvent {}

final class GoIntocategories extends CategoriesEvent {
  int index;
  GoIntocategories({required this.index});
}
