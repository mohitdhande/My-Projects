part of 'loginsignup_bloc.dart';

@immutable
sealed class LoginsignupState {}

final class LoginsignupInitial extends LoginsignupState {}

final class OnSignupPage extends LoginsignupState {}

final class OnLoginPage extends LoginsignupState {}

final class SignUpSuccessful extends LoginsignupState {}

final class SignUpUnsuccessful extends LoginsignupState {}

final class LoginSignupLoading extends LoginsignupState {}

final class LoginSuccessful extends LoginsignupState {}

final class LoginUnsuccessful extends LoginsignupState {}

final class PasswordLength extends LoginsignupState {}

final class AlreadySignedUp extends LoginsignupState {}
