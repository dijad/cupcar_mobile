import 'package:cupcar_mobile/views/pages/lobby.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cupcar_mobile/views/pages/login.dart';
import 'bloc/login/login_bloc.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        // Add more BlocProviders here for other Blocs
      ],
      child: MaterialApp(
        title: 'CupCar',
        initialRoute: 'login',
        routes: {
          'login': (context) => const LoginPage(),
          'lobby': (context) => const LobbyPage(),
          // Add more routes here
        },
      ),
    ));
