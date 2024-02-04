import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Calculadora(),
      debugShowCheckedModeBanner: false,
    )
  );
}


class Calculadora extends StatefulWidget {
  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Title(color: Colors.black87, child: Text('Calculadora'))],
      ),
    );
  }
}
  
