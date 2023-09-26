import 'package:cupcar_mobile/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/button.dart';
import '../components/textFormFiledEmail.dart';
import '../components/textFormFiledPassword.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    final TextEditingController emailTextController = TextEditingController();
    final TextEditingController passwordTextController =
        TextEditingController();

    return LoginBlocProvider(
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Image(
                  image: const AssetImage('assets/images/logo.png'),
                  width: ScreenUtil().setWidth(290),
                  height: ScreenUtil().setHeight(300),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.09),
                  child: customTextFormFieldEmail(
                      'Correo electrónico',
                      'Por favor ingrese un correo electrónico',
                      emailTextController),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.09),
                  child: CustomTextFormFieldPass('Contraseña',
                      'Ingrese su contraseña', passwordTextController),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.09),
                  child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text('¿Olvidaste tu contraseña?',
                          style: TextStyle(
                              color: Color.fromARGB(255, 65, 95, 214)))),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                customButton(
                    context, emailTextController, passwordTextController),
                SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                const Text(
                  'Si aún no eres parte del equipo CupCar',
                  style: TextStyle(color: Color.fromARGB(255, 65, 95, 214)),
                ),
                const Text(
                  'toca aquí',
                  style: TextStyle(color: Color.fromARGB(255, 65, 95, 214)),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
