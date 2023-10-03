part of "signup_bloc.dart";

abstract class SignUpEvent {}

class SignUpFormOneEvent extends SignUpEvent {
  final String name;
  final String lastname;
  final String gender;
  final String phoneNumber;

  SignUpFormOneEvent(this.name, this.lastname, this.gender, this.phoneNumber);
}

class AddCityEvent extends SignUpEvent {
  final String daneCodeCity;

  AddCityEvent(this.daneCodeCity);
}

class RemoveCityEvent extends SignUpEvent {
  final String daneCodeCity;

  RemoveCityEvent(this.daneCodeCity);
}
