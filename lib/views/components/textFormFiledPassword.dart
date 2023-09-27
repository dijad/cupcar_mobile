import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cupcar_mobile/bloc/login/login_bloc.dart';

// ignore: must_be_immutable
class CustomTextFormFieldPass extends StatelessWidget {
  CustomTextFormFieldPass(
      this.hintText, this.emptyMessage, this.controllerTextPass,
      {super.key});

  final TextEditingController controllerTextPass;
  late String emptyMessage;
  late String hintText;

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (_, state) {
        return TextFormField(
          controller: controllerTextPass,
          obscureText: state.obscureText,
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: const Icon(Icons.lock,
                  color: Color.fromARGB(255, 65, 95, 214)),
              suffixIcon: IconButton(
                icon: Icon(
                  state.obscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromARGB(255, 65, 95, 214),
                ),
                onPressed: () {
                  loginBloc.add(ChangeObscureTextPasswordEvent());
                },
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 231, 230, 230))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 65, 95, 214)))),
        );
      },
    );
  }
}
