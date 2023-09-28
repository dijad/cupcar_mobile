import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cupcar_mobile/bloc/login/login_bloc.dart';

Widget customButton(context, emailController, passController) {
  final loginBloc = BlocProvider.of<LoginBloc>(context);
  ScreenUtil.init(context);

  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return ElevatedButton(
      onPressed: () {
        loginBloc.add(
            SendCredentialsEvent(emailController.text, passController.text));
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: const Color.fromARGB(255, 65, 95, 214),
          fixedSize:
              Size(ScreenUtil().setWidth(290), ScreenUtil().setHeight(40)),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.09)),
      child: Text('Ingresar',
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 255, 255, 255)))),
    );
  });
}
