import 'package:app_compras/paginas/Inicio.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aplicación de Compras',
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}