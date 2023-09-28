// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customTextFormField(hintText, textInputType, controllerTextEmail) {
  return TextFormField(
    controller: controllerTextEmail,
    decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
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
    keyboardType: textInputType,
  );
}
