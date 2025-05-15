// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:menu_lateral_miguel_gutierrez_b/src/home.dart';
import 'package:menu_lateral_miguel_gutierrez_b/src/calculadora.dart';
import 'package:menu_lateral_miguel_gutierrez_b/src/formulario.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/calculadora': (context) => const Calculadora(title: 'Calculadora'),
        '/formulario': (context) => const Formulario(title: 'Formulario'),
      },
    );
  }
}
