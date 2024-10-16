part of 'loginsignup_bloc.dart';

@immutable
sealed class LoginsignupEvent {}

final class GoToSignup extends LoginsignupEvent {}

final class GoBackToLogin extends LoginsignupEvent {}

final class SignupAddToDB extends LoginsignupEvent {
  final String username;
  final String password;

  SignupAddToDB({required this.username, required this.password});
}

final class LoginToGrocy extends LoginsignupEvent {
  final String username;
  final String password;

  LoginToGrocy({required this.username, required this.password});
}
