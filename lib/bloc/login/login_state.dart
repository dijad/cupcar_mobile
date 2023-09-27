part of "login_bloc.dart";

class LoginState {
  final bool obscureText;
  final bool status;
  final String data;
  final bool loading;

  LoginState(
      {this.obscureText = true,
      this.status = false,
      this.data = '',
      this.loading = false});

  LoginState copyWith(
          {bool? obscureText, bool? status, String? data, bool? loading}) =>
      LoginState(
          obscureText: obscureText ?? this.obscureText,
          status: status ?? this.status,
          data: data ?? this.data,
          loading: loading ?? this.loading);

  LoginState initialState() => LoginState();
}
