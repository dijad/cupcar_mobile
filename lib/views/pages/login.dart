import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:cupcar_mobile/bloc/login/login_bloc.dart';

import '../components/customButtonLogin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    late double height = MediaQuery.of(context).size.height;
    late double width = MediaQuery.of(context).size.width;

    final form = FormGroup({
      'email': FormControl<String>(value: ''),
      'password': FormControl<String>(value: '')
    });

    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (_, state) {
          if (state.status == true) {
            Navigator.pushNamed(context, 'lobby');
          } else if (state.status == false) {
            ScaffoldMessenger.of(_).showSnackBar(SnackBar(
              content: Text(
                state.data,
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (_, state) {
            return SingleChildScrollView(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image(
                          image: const AssetImage('assets/images/logo.png'),
                          width: ScreenUtil().setWidth(290),
                          height: ScreenUtil().setHeight(300),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.09),
                          child: ReactiveForm(
                            formGroup: form,
                            child: Column(
                              children: [
                                ReactiveTextField<String>(
                                  formControlName: 'email',
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.email,
                                          color:
                                              Color.fromARGB(255, 65, 95, 214)),
                                      floatingLabelStyle:
                                          GoogleFonts.montserrat(
                                              color: const Color.fromARGB(
                                                  255, 65, 95, 214)),
                                      labelText: 'Correo electrónico',
                                      labelStyle: GoogleFonts.montserrat(
                                          fontSize: 16.0),
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 65, 95, 214)))),
                                ),
                                SizedBox(height: height * 0.025),
                                ReactiveTextField<String>(
                                  obscureText: state.obscureText,
                                  formControlName: 'password',
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.lock,
                                          color:
                                              Color.fromARGB(255, 65, 95, 214)),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          state.obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: const Color.fromARGB(
                                              255, 65, 95, 214),
                                        ),
                                        onPressed: () {
                                          loginBloc.add(
                                              ChangeObscureTextPasswordEvent());
                                        },
                                      ),
                                      floatingLabelStyle:
                                          GoogleFonts.montserrat(
                                              color: const Color.fromARGB(
                                                  255, 65, 95, 214)),
                                      labelText: 'Contraseña',
                                      labelStyle: GoogleFonts.montserrat(
                                          fontSize: 16.0),
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 65, 95, 214)))),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.025),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.09),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '¿Olvidaste tu contraseña?',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 65, 95, 214),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.025),
                        state.loading
                            ? const CircularProgressIndicator()
                            : customButtonLogin(
                                context,
                                form
                              ),
                        SizedBox(height: height * 0.025),
                        Text(
                          'Si aún no eres parte del equipo CupCar',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 65, 95, 214),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'signUpOne');
                          },
                          child: Text(
                            'toca aquí.',
                            style: GoogleFonts.montserrat(
                              decoration: TextDecoration.underline,
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 65, 95, 214),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.025)
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
