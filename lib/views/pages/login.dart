import 'package:cupcar_mobile/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/button.dart';
import '../components/customTextFormFiled.dart';
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
          } else if (state.status == false) {
            ScaffoldMessenger.of(_).showSnackBar(SnackBar(
              content: Text(state.data,
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 255, 255,
                              255)))), // show notification with message
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
                  child: customTextFormField('Correo electrónico',
                      TextInputType.emailAddress, emailTextController),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.09),
                  child: CustomTextFormFieldPass(
                      'Contraseña', passwordTextController),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.09),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('¿Olvidaste tu contraseña?',
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 65, 95, 214)))),
                    )),
                SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                state
                        .loading // show CircularProgressIndicator if loading is true
                    ? const CircularProgressIndicator()
                    : customButton(
                        context, emailTextController, passwordTextController),
                SizedBox(height: MediaQuery.of(context).size.width * 0.06),
                Text('Si aún no eres parte de CupCar',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 65, 95, 214)))),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'signUp');
                    },
                    child: Text('toca aquí.',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 65, 95, 214)))))
              ],
            ),
          );
        }),
      ),
    );
  }
}
