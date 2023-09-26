import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cupcar_mobile/bloc/login_bloc.dart';

// ignore: must_be_immutable
class CustomTextFormFieldPass extends StatelessWidget {
  late String hintText;
  late String emptyMessage;
  final TextEditingController controllerTextPass;

  CustomTextFormFieldPass(
      this.hintText, this.emptyMessage, this.controllerTextPass,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return LoginBlocProvider(
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
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
                    context
                        .read<LoginBloc>()
                        .add(ChangeObscureTextPasswordEvent());
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
      ),
    );
  }
}
