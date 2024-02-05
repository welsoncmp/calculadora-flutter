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
  String numero = '';
  double a = 0.0;
  String operacao = '';
  double resultado = 0.0;

  void calcular(String tecla){
    switch(tecla){
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          numero += tecla;
          numero = numero.replaceAll(',', '.');
        });
        break;
      case '+':
      case '-':
      case '/':
      case 'X':
        if (numero != '') {
          a = num.parse(numero).toDouble();
          numero += ' ' + tecla + ' ';
        }
        operacao = tecla;
        break;
      case '=':
        if (operacao != '') {
          numero = numero.replaceAll(',', '.');
          double b = num.parse(numero.split(operacao).last).toDouble();
          switch(operacao){
            case '+':
              resultado = a + b;
              break;
            case '-':
              resultado = a - b;
              break;
            case '/':
              resultado = a / b;
              break;
            case 'X':
              resultado = a * b;
              break;
          }
          a = resultado;
          setState(() {
            numero = (resultado % 1 == 0) ? resultado.toInt().toString() : resultado.toStringAsFixed(2);
            numero = numero.replaceAll('.', ',');
          });
          operacao = '';
        }
        break;
      case 'AC':
        setState(() {
          numero = '';
          a = 0.0;
          operacao = '';
          resultado = 0.0;
        });
        break;
      case '<X':
        setState(() {
          if (numero.length > 0) {
            numero = numero.substring(0, numero.length - 1);
          }
        });
        break;
      default:
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Calculadora'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(numero, style: TextStyle(fontSize: 70),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(onTap: () => calcular('AC'),child: Text('AC', style: TextStyle(fontSize: 48),)),
              Text(' ', style: TextStyle(fontSize: 48),),
              Text(' ', style: TextStyle(fontSize: 48),),
              GestureDetector(onTap: () => calcular('<X'),child: Text('<X', style: TextStyle(fontSize: 48),)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(onTap: () => calcular('7'),child: Text('7', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular('8'),child: Text('8', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular('9'),child: Text('9', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular('/'),child: Text('/', style: TextStyle(fontSize: 48),)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(onTap: () => calcular('4'),child: Text('4', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular('5'),child: Text('5', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular('6'),child: Text('6', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular('X'),child: Text('X', style: TextStyle(fontSize: 48),)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(onTap: () => calcular('1'),child: Text('1', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular('2'),child: Text('2', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular('3'),child: Text('3', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular('-'),child: Text('-', style: TextStyle(fontSize: 48),)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(onTap: () => calcular('0'),child: Text('0', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular(','),child: Text(',', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular('='),child: Text('=', style: TextStyle(fontSize: 48),)),
              GestureDetector(onTap: () => calcular('+'),child: Text('+', style: TextStyle(fontSize: 48),)),
            ],
          ),
        ],
      )
    );
  }
}
  
