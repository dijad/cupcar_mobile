// ignore_for_file: file_names

import 'package:cupcar_mobile/bloc/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Widget containerCity(final String cityNameIn, context) {
  final String cityName = cityNameIn;

  final signupBloc = BlocProvider.of<SignUpBloc>(context);

  final BoxDecoration decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: const Color.fromARGB(255, 191, 219, 254),
  );

  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: decoration,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            Text(
              cityName,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 65, 95, 214),
                ),
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                signupBloc.add(RemoveCityEvent(cityName));
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 12,
              ),
            )
          ],
        ),
      ),
    );
  });
}
