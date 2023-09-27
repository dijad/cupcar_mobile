import 'package:cupcar_mobile/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return const Scaffold(body: Center(child: Text('hola')));
    });
  }
}
