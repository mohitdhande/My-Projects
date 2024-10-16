import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<GoIntocategories>(_goIntoCategories);
  }

  void _goIntoCategories(
      GoIntocategories event, Emitter<CategoriesState> emit) {
    if (event.index == 0) {
      emit(VegetableList());
    }
    if (event.index == 1) {
      emit(CFruitsList());
    }
    if (event.index == 2) {
      emit(DairyProductsList());
    }
    if (event.index == 3) {
      emit(CookingEssentialsList());
    }
    if (event.index == 4) {
      emit(SnacksList());
    }
    if (event.index == 5) {
      emit(PackageFoodList());
    }
    if (event.index == 6) {
      emit(BeveragesList());
    }
    if (event.index == 7) {
      emit(HouseHoldList());
    }
  }
}
