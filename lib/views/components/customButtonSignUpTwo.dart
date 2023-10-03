// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cupcar_mobile/bloc/signup/signup_bloc.dart';

Widget customButtonSignUpTwo(context, form) {
  final signupBloc = BlocProvider.of<SignUpBloc>(context);
  ScreenUtil.init(context);

  late double width = MediaQuery.of(context).size.width;

  return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
    return ElevatedButton(
      onPressed: () {
        signupBloc.add(SignUpFormOneEvent(
            form.control('name').value,
            form.control('lastname').value,
            form.control('gender').value,
            form.control('phone').value));
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: const Color.fromARGB(255, 65, 95, 214),
          fixedSize:
              Size(ScreenUtil().setWidth(290), ScreenUtil().setHeight(40)),
          padding: EdgeInsets.symmetric(horizontal: width * 0.09)),
      child: Text('Continuar',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 255, 255, 255)))),
    );
  });
}
