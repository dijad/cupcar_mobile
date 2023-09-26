import 'package:cupcar_mobile/views/pages/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'CupCar',
      home: const LoginPage(),
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
    ));
