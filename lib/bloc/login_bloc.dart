import 'package:cupcar_mobile/logic/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginState {
  final bool obscureText;
  final bool? status;
  final String? data;

  LoginState({required this.obscureText, this.status = false, this.data});
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String _email = '';
  String _password = '';
  bool _obscureText = true;

  LoginBloc() : super(LoginState(obscureText: true)) {
    on<ChangeObscureTextPasswordEvent>((event, emit) {
      _obscureText = !_obscureText;
      emit(LoginState(obscureText: _obscureText));
    });

    on<SendCredentialsEvent>((event, emit) async {
      _email = event.email;
      _password = event.password;

      final response = await login(_email, _password);
      final status = response['status'];
      final data = response['data'];

      emit(LoginState(obscureText: _obscureText, status: status, data: data));
    });
  }
}

abstract class LoginEvent {}

class ChangeObscureTextPasswordEvent extends LoginEvent {}

class SendCredentialsEvent extends LoginEvent {
  final String email;
  final String password;

  SendCredentialsEvent(this.email, this.password);
}

class LoginBlocProvider extends BlocProvider<LoginBloc> {
  LoginBlocProvider({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          create: (BuildContext context) => LoginBloc(),
          child: child,
        );
}
