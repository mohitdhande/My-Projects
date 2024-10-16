import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<CategoriesViewAll>(_homeCategoriesViewAll);
    on<HGoIntocategories>(_goIntoCategories);
    on<DHome>(_goToHome);
    on<DMyOrders>(_goToMyOrders);
    on<DtrackOrders>(_goToTrackOrders);
    on<Dprofile>(_goToProfile);
    on<Doffers>(_goToOffers);
    on<Dnotify>(_goToNotify);
    on<Dhelp>(_goToHelp);
    on<Dprivacy>(_goToProvacy);
    on<DAbout>(_goToAbout);
    on<DLogout>(_goToLogout);
    on<DSettings>(_goToSettings);
    on<DWishlist>(_goToWish);
    on<DCartlist>(_goToCart);
  }

  void _homeCategoriesViewAll(
      CategoriesViewAll event, Emitter<HomeState> emit) {
    emit(OnCategoriesPage());
  }

  void _goIntoCategories(HGoIntocategories event, Emitter<HomeState> emit) {
    if (event.index == 0) {
      emit(HVegetableList());
    }
    if (event.index == 1) {
      emit(HFruitList());
    }
    if (event.index == 2) {
      emit(HDairyproductList());
    }
    if (event.index == 3) {
      emit(HCookingList());
    }
  }

  void _goToHome(DHome event, Emitter<HomeState> emit) {
    emit(OnDHome());
  }

  void _goToMyOrders(DMyOrders event, Emitter<HomeState> emit) {
    emit(OnMyOrders());
  }

  void _goToTrackOrders(DtrackOrders event, Emitter<HomeState> emit) {
    emit(OntrackOrders());
  }

  void _goToProfile(Dprofile event, Emitter<HomeState> emit) {
    emit(OnProfile());
  }

  void _goToOffers(Doffers event, Emitter<HomeState> emit) {
    emit(OnOffers());
  }

  void _goToNotify(Dnotify event, Emitter<HomeState> emit) {
    emit(OnNotify());
  }

  void _goToHelp(Dhelp event, Emitter<HomeState> emit) {
    emit(OnHelp());
  }

  void _goToProvacy(Dprivacy event, Emitter<HomeState> emit) {
    emit(OnPrivacy());
  }

  void _goToAbout(DAbout event, Emitter<HomeState> emit) {
    emit(OnAboutUs());
  }

  void _goToLogout(DLogout event, Emitter<HomeState> emit) {
    emit(OnLogout());
  }

  void _goToSettings(DSettings event, Emitter<HomeState> emit) {
    emit(OnSettings());
  }

  void _goToWish(DWishlist event, Emitter<HomeState> emit) {
    emit(OnWish());
  }

  void _goToCart(DCartlist event, Emitter<HomeState> emit) {
    emit(OnWCart());
  }
}
