import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<SignUpFormOneEvent>((event, emit) {
      if (event.name != '' &&
          event.lastname != '' &&
          event.gender != '' &&
          event.phoneNumber != '') {
        emit(state.copyWith(
          name: event.name,
          lastname: event.lastname,
          gender: event.gender,
          phoneNumber: event.phoneNumber,
          signUpFormOneCheck: true,
        ));
      } else {
        emit(state.copyWith(signUpFormOneCheck: false));
      }
    });

    on<AddCityEvent>((event, emit) {
      if (event.daneCodeCity != '') {
        emit(state.copyWith(
          favDaneCodeCities: [...state.favDaneCodeCities, event.daneCodeCity],
        ));
      }
    });

    on<RemoveCityEvent>((event, emit) {
      if (event.daneCodeCity != '') {
        emit(state.copyWith(
          favDaneCodeCities: [
            ...state.favDaneCodeCities
                .where((city) => city != event.daneCodeCity),
          ],
        ));
      }
    });
  }
}
