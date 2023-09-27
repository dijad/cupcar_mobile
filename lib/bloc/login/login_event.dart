part of "login_bloc.dart";

abstract class LoginEvent {}

class ChangeObscureTextPasswordEvent extends LoginEvent {}

class SendCredentialsEvent extends LoginEvent {
  final String email;
  final String password;

  SendCredentialsEvent(this.email, this.password);
}

class LoginLoadingEvent extends LoginEvent {}
