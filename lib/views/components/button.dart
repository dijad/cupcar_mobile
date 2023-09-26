import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cupcar_mobile/bloc/login_bloc.dart';

Widget customButton(context, emailController, passController) {
  ScreenUtil.init(context);

  return LoginBlocProvider(
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return ElevatedButton(
      onPressed: () {
        context.read<LoginBloc>().add(
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
      child: const Text('Ingresar'),
    );
  }));
}