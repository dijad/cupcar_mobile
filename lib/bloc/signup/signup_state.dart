part of "signup_bloc.dart";

class SignUpState {
  final List<Object> cities;

  //Primer form
  final bool? signUpFormOneCheck;
  final String name;
  final String lastname;
  final String gender;
  final String phoneNumber;
  //Segundo form
  final bool? signUpFormTwoCheck;
  final List<String> favDaneCodeCities;

  SignUpState(
      {this.cities = const [],
      //Primer form
      this.gender = '',
      this.signUpFormOneCheck,
      this.name = '',
      this.lastname = '',
      this.phoneNumber = '',
      //Segundo form
      this.signUpFormTwoCheck,
      this.favDaneCodeCities = const []});

  SignUpState copyWith(
          {
          //Primer form
          String? gender,
          String? name,
          String? lastname,
          String? phoneNumber,
          bool? signUpFormOneCheck,
          //Segundo form
          bool? signUpFormTwoCheck,
          List<String>? favDaneCodeCities}) =>
      SignUpState(
          //cities: await getCities(),
          //Primer form
          gender: gender ?? this.gender,
          name: name ?? this.name,
          lastname: lastname ?? this.lastname,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          signUpFormOneCheck: signUpFormOneCheck ?? this.signUpFormOneCheck,
          //Segundo form
          signUpFormTwoCheck: signUpFormTwoCheck ?? this.signUpFormTwoCheck,
          favDaneCodeCities: favDaneCodeCities ?? this.favDaneCodeCities);
}
