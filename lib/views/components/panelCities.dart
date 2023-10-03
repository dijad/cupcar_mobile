// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cupcar_mobile/bloc/signup/signup_bloc.dart';
import 'containerCity.dart';

Widget panelCities(context) {
  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    final List<Widget> containersCity = state.favDaneCodeCities
        .map((city) => containerCity(city, context))
        .toList();

    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 2,
      runSpacing: 4,
      children: containersCity
          .expand((widget) => [widget, const SizedBox(width: 10)])
          .toList(),
    );
  });
}
