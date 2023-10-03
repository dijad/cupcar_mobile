//import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cupcar_mobile/bloc/signup/signup_bloc.dart';

import '../components/customLinearProgressIndicator.dart';
import '../components/customButtonSignUpOne.dart';

class SignUpPageOne extends StatelessWidget {
  const SignUpPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    late double height = MediaQuery.of(context).size.height;
    late double width = MediaQuery.of(context).size.width;

    final form = FormGroup({
      'name': FormControl<String>(value: ''),
      'lastname': FormControl<String>(value: ''),
      'gender': FormControl<String>(value: ''),
      'phone': FormControl<String>(value: '')
    });

    final genderDropdownItems = _buildGenderDropdownItems();

    return BlocListener<SignUpBloc, SignUpState>(
        listener: (_, state) {
          if (state.signUpFormOneCheck == true) {
            Navigator.pushNamed(context, 'signUpTwo');
          } else if (state.signUpFormOneCheck == false) {
            ScaffoldMessenger.of(_).showSnackBar(SnackBar(
              content: Text('Todos los campos son requeridos.',
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
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: height * 0.09),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.09),
                    child:
                        const CustomLinearProgressIndicator(progressValue: 0),
                  ),
                  SizedBox(height: height * 0.025),
                  Image(
                    image: const AssetImage('assets/images/logo.png'),
                    width: ScreenUtil().setWidth(290),
                    height: ScreenUtil().setHeight(200),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.09),
                    child: ReactiveForm(
                      formGroup: form,
                      child: Column(
                        children: [
                          ReactiveTextField<String>(
                            formControlName: 'name',
                            decoration: InputDecoration(
                                floatingLabelStyle: GoogleFonts.montserrat(
                                    color:
                                        const Color.fromARGB(255, 65, 95, 214)),
                                labelText: 'Nombre',
                                labelStyle:
                                    GoogleFonts.montserrat(fontSize: 16.0),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 65, 95, 214)))),
                          ),
                          SizedBox(height: height * 0.025),
                          ReactiveTextField<String>(
                            formControlName: 'lastname',
                            decoration: InputDecoration(
                                floatingLabelStyle: GoogleFonts.montserrat(
                                    color:
                                        const Color.fromARGB(255, 65, 95, 214)),
                                labelText: 'Apellido',
                                labelStyle:
                                    GoogleFonts.montserrat(fontSize: 16.0),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 65, 95, 214)))),
                          ),
                          SizedBox(height: height * 0.025),
                          ReactiveDropdownField<String>(
                            formControlName: 'gender',
                            items: genderDropdownItems,
                            decoration: InputDecoration(
                                floatingLabelStyle: GoogleFonts.montserrat(
                                    color:
                                        const Color.fromARGB(255, 65, 95, 214)),
                                labelText: 'Género',
                                labelStyle:
                                    GoogleFonts.montserrat(fontSize: 16.0),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 65, 95, 214)))),
                          ),
                          SizedBox(height: height * 0.025),
                          ReactiveTextField<String>(
                            formControlName: 'phone',
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                floatingLabelStyle: GoogleFonts.montserrat(
                                    color:
                                        const Color.fromARGB(255, 65, 95, 214)),
                                labelText: 'Número de celular',
                                labelStyle:
                                    GoogleFonts.montserrat(fontSize: 16.0),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 65, 95, 214)))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.06),
                  customButtonSignUpOne(context, form),
                  SizedBox(height: height * 0.025),
                  Text(
                    'Si ya eres parte del equipo CupCar',
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
                      Navigator.pushNamed(context, 'login');
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
                  SizedBox(height: height * 0.025),
                ],
              ),
            ),
          ),
        ));
  }
}

List<DropdownMenuItem<String>> _buildGenderDropdownItems() {
  final List<String> genderOptions = ['Masculino', 'Femenino', 'Otro'];

  final List<DropdownMenuItem<String>> genderDropdownItems = genderOptions
      .map((gender) => DropdownMenuItem<String>(
            value: gender,
            child: Text(
              gender,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ))
      .toList();

  return genderDropdownItems;
}
