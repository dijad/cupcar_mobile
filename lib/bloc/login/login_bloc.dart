import 'package:cupcar_mobile/logic/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<ChangeObscureTextPasswordEvent>((event, emit) {
      emit(state.copyWith(obscureText: !state.obscureText));
    });

    on<SendCredentialsEvent>((event, emit) async {
      emit(state.copyWith(loading: true));
      final loginResponse = await login(event.email, event.password);
      final status = loginResponse['status'];
      final data = loginResponse['data'];
      emit(state.copyWith(status: status, data: data, loading: false));
    });
  }
}
