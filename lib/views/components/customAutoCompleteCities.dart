// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cupcar_mobile/bloc/signup/signup_bloc.dart';

Widget customAutoCompleteCities(context, height, width) {
  final signupBloc = BlocProvider.of<SignUpBloc>(context);
  final List<String> cities = [
    'Tunja',
    'tunja2',
    'Villa de San Diego de Ubate'
  ];

  return Autocomplete<String>(
    optionsBuilder: (TextEditingValue textEditingValue) {
      if (textEditingValue.text.isEmpty) {
        return const Iterable<String>.empty();
      }
      final filteredOptions = cities
          .where((option) => option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()))
          .toSet()
          .toList();
      return filteredOptions;
    },
    displayStringForOption: (option) => option,
    optionsViewBuilder: (context, onSelected, options) => Container(
      padding: EdgeInsets.only(right: width / 5.5),
      child: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          final String option = options.elementAt(index);
          return Material(
            elevation: 2,
            child: GestureDetector(
              onTap: () {
                onSelected(option);
              },
              child: ListTile(
                title: Text(option),
              ),
            ),
          );
        },
      ),
    ),
    onSelected: (String selected) {
      signupBloc.add(AddCityEvent(selected));
    },
    fieldViewBuilder: (BuildContext context,
        TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted) {
      return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          onFieldSubmitted: (value) {
            onFieldSubmitted();
          },
          decoration: InputDecoration(
              hintText: 'Ciudad',
              hintStyle: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              prefixIcon: const Icon(Icons.location_on,
                  color: Color.fromARGB(255, 65, 95, 214))),
          keyboardType: TextInputType.text);
    },
  );
}
