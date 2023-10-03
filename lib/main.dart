import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cupcar_mobile/views/pages/lobby.dart';
import 'package:cupcar_mobile/views/pages/sign_up_one.dart';
import 'package:cupcar_mobile/views/pages/sign_up_two.dart';

import 'package:cupcar_mobile/views/pages/login.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/signup/signup_bloc.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(),
        )
        // Add more BlocProviders here for other Blocs
      ],
      child: MaterialApp(
        title: 'CupCar',
        initialRoute: 'login',
        routes: {
          'login': (context) => const LoginPage(),
          'lobby': (context) => const LobbyPage(),
          'signUpOne': (context) => const SignUpPageOne(),
          'signUpTwo': (context) => const SignUpPageTwo(),
          // Add more routes here
        },
      ),
    ));
