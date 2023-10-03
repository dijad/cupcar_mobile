// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {

  final double progressValue;


  const CustomLinearProgressIndicator({
    required this.progressValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: LinearProgressIndicator(
          value: progressValue,
            minHeight: 10,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(
                Color.fromARGB(255, 65, 95, 214)),
        ),
      ),
    );
  }
}
