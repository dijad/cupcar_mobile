import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cupcar_mobile/bloc/signup/signup_bloc.dart';
import '../components/panelCities.dart';
import '../components/customAutoCompleteCities.dart';
import '../components/customButtonSignUpTwo.dart';
import '../components/customLinearProgressIndicator.dart';

class SignUpPageTwo extends StatelessWidget {
  const SignUpPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.signUpFormTwoCheck == true) {
          Navigator.pushNamed(context, 'login');
        } else if (state.signUpFormTwoCheck == false) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Todos los campos son requeridos.',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(250, 250, 250, 250),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'signUpOne');
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: const Color.fromARGB(255, 65, 95, 214),
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: width * 0.05),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.09),
                      child: const CustomLinearProgressIndicator(
                          progressValue: 0.5),
                    ),
                    Image(
                      image: const AssetImage('assets/images/logo.png'),
                      width: ScreenUtil().setWidth(290),
                      height: ScreenUtil().setHeight(150),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                      child: ListTile(
                        leading: const Icon(
                          Icons.info_outline,
                          color: Color.fromARGB(255, 65, 95, 214),
                        ),
                        title: Text(
                          'Selecciona dos ciudades para agregarlos a tus ciudades favoritas. (Esto se usará para sugerirte ofertas que puedan interesarte)',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 48, 47, 47),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.09),
                      child: customAutoCompleteCities(context, height, width),
                    ),
                    SizedBox(height: height * 0.02),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.09),
                        child: Text(
                          '*Ingrese al menos 3 letras para la búsqueda',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 76, 75, 75),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Container(
                        margin: EdgeInsets.only(right: width * 0.32),
                        child: Text(
                          'Ciudades seleccionadas',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 76, 75, 75),
                            ),
                          ),
                        )),
                    SizedBox(height: height * 0.01),
                    Container(
                        width: width - width * 0.13,
                        margin: EdgeInsets.symmetric(horizontal: width * 0.065),
                        child: panelCities(context)),
                    SizedBox(height: height * 0.07),
                    customButtonSignUpTwo(context, {}),
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
