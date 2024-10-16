import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mohit_bloc_1/LoginSignup/loginSignupdb/logindb.dart';

part 'loginsignup_event.dart';
part 'loginsignup_state.dart';

class LoginsignupBloc extends Bloc<LoginsignupEvent, LoginsignupState> {
  LoginDatabase blocDbInstance = LoginDatabase.loginClass;
  LoginsignupBloc() : super(LoginsignupInitial()) {
    on<GoToSignup>(_goToSignup);
    on<GoBackToLogin>(_goBackToLogin);
    on<SignupAddToDB>(_addToDb);
    on<LoginToGrocy>(_loginToGrocy);
  }

  void _goToSignup(GoToSignup event, Emitter<LoginsignupState> emit) {
    emit(OnSignupPage());
  }

  void _goBackToLogin(GoBackToLogin event, Emitter<LoginsignupState> emit) {
    emit(OnLoginPage());
  }

  void _addToDb(SignupAddToDB event, Emitter<LoginsignupState> emit) async {
    final String username = event.username;
    final String password = event.password;
    bool checkIfAlreadySignedUp = false;
    bool check = false;

    if (username.isNotEmpty && password.isNotEmpty) {
      if (password.length > 6) {
        checkIfAlreadySignedUp =
            await blocDbInstance.getValidate(password: password);

        if (checkIfAlreadySignedUp) {
          emit(AlreadySignedUp());
        } else {
          check = await blocDbInstance.getInsert(
              Username: username, Password: password);
          if (check) {
            emit(SignUpSuccessful());
          }
        }
      } else {
        emit(PasswordLength());
      }
    } else {
      emit(SignUpUnsuccessful());
    }
  }

  void _loginToGrocy(LoginToGrocy event, Emitter<LoginsignupState> emit) async {
    emit(LoginSignupLoading());

    String username = event.username;
    String password = event.password;
    bool check = false;

    if (username.isNotEmpty && password.isNotEmpty) {
      if (password.length > 6) {
        check = await blocDbInstance.getValidate(password: password);
        if (check) {
          emit(LoginSuccessful());
        }
      } else {
        emit(PasswordLength());
      }
    } else {
      emit(LoginUnsuccessful());
    }
  }
}
