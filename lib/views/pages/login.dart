import 'package:cupcar_mobile/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/button.dart';
import '../components/textFormFiledEmail.dart';
import '../components/textFormFiledPassword.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    final TextEditingController emailTextController = TextEditingController();
    final TextEditingController passwordTextController =
        TextEditingController();

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (_, state) {
          if (state.status == true) {
            Navigator.pushNamed(context, 'lobby');
          } else {
            ScaffoldMessenger.of(_).showSnackBar(SnackBar(
              content:
                  Text(state.data.toString()), // show notification with message
              backgroundColor: Colors.red,
            ));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(builder: (_, state) {
          return Center(
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
                state
                        .loading // show CircularProgressIndicator if loading is true
                    ? CircularProgressIndicator()
                    : customButton(
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
          );
        }
        ),
      ),
    );
  }
}
