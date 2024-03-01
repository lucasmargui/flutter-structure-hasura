//Criando uma classe AppColors passando o construtor internamente AppColors._(); para que não seja necessário instancia-la pois só queremos acessar suas propriedades

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color bluedarkOne = Color.fromARGB(246, 0, 32, 83);
  static const Color bluedarkTwo = Color.fromARGB(246, 1, 10, 24);
  static const Color bluedarkThree = Color.fromARGB(255, 0, 0, 0);
  static const Color white = Colors.white;
  static const Color iceWhite = Color.fromARGB(255, 239, 240, 247);
  static const Color grey = Colors.grey;
  static const Color lightgrey = Color.fromARGB(255, 202, 202, 202);
  static const Color darkgrey = Color.fromARGB(255, 90, 90, 90);

  static const List<Color> blueDarkGradient = [
    Color.fromARGB(246, 1, 10, 24),
    Color.fromARGB(255, 0, 0, 0)
  ];
  static const List<Color> greyDarkGradient = [
    Color.fromARGB(246, 207, 207, 207),
    Color.fromARGB(246, 207, 207, 207)
  ];
}
