// ignore: file_names
import 'package:flutter/material.dart';

Widget customTextFormFieldEmail(hintText, emptyMessage, controllerTextEmail) {
  return TextFormField(
    controller: controllerTextEmail,
    decoration: InputDecoration(
        hintText: hintText,
        prefixIcon:
            const Icon(Icons.email, color: Color.fromARGB(255, 65, 95, 214)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 231, 230, 230))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 65, 95, 214)))),
    keyboardType: TextInputType.emailAddress,
  );
}
