// Importando o pacote Flutter Material Design.
import 'package:flutter/material.dart';

// Função principal que executa o aplicativo.
void main() {
  runApp(
      MaterialApp(
        home: Calculadora(), // Define a tela inicial do aplicativo.
        debugShowCheckedModeBanner: false, // Remove a faixa de depuração.
      )
  );
}

// Widget Calculadora que é um StatefulWidget, o que significa que mantém o estado.
class Calculadora extends StatefulWidget {
  @override
  State<Calculadora> createState() => _CalculadoraState(); // Cria o estado para o widget Calculadora.
}

// Classe de estado para o widget Calculadora.
class _CalculadoraState extends State<Calculadora> {
  String numero = ''; // Armazena o número atualmente exibido.
  double a = 0.0; // Armazena o primeiro número para cálculos.
  String operacao = ''; // Armazena a operação a ser realizada.
  double resultado = 0.0; // Armazena o resultado do cálculo.
  int maxDigits = 10; // Armazena o número máximo de dígitos que podem ser inseridos.

  // Função para realizar cálculos com base na tecla pressionada.
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
          // Obtém a largura da tela e atualiza o número máximo de dígitos.
          maxDigits = MediaQuery.of(context).size.width ~/ 40;
          // Se o número exceder o número máximo de dígitos, remove os dígitos extras do final.
          if (numero.length > maxDigits) {
            numero = numero.substring(0, maxDigits);
          }
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

  // Função para construir a interface do usuário do aplicativo.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Calculadora'), // Título da aplicação.
          ),
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(numero, style: TextStyle(fontSize: 70, color: Colors.indigo),), // Exibe o número atual.
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap: () => calcular('AC'),child: Text('AC', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.indigo),)),
                Text(' ', style: TextStyle(fontSize: 48),),
                Text(' ', style: TextStyle(fontSize: 48),),
                GestureDetector(onTap: () => calcular('<X'),child: Image.asset('assets/images/apagar.png', width: 60,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap: () => calcular('7'),child: Text('7', style: TextStyle(fontSize: 48),)),
                GestureDetector(onTap: () => calcular('8'),child: Text('8', style: TextStyle(fontSize: 48),)),
                GestureDetector(onTap: () => calcular('9'),child: Text('9', style: TextStyle(fontSize: 48),)),
                GestureDetector(onTap: () => calcular('/'),child: Image.asset('assets/images/divisao.png', width: 50,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap: () => calcular('4'),child: Text('4', style: TextStyle(fontSize: 48),)),
                GestureDetector(onTap: () => calcular('5'),child: Text('5', style: TextStyle(fontSize: 48),)),
                GestureDetector(onTap: () => calcular('6'),child: Text('6', style: TextStyle(fontSize: 48),)),
                GestureDetector(onTap: () => calcular('X'),child: Image.asset('assets/images/multiplicacao.png', width: 50,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap: () => calcular('1'),child: Text('1', style: TextStyle(fontSize: 48),)),
                GestureDetector(onTap: () => calcular('2'),child: Text('2', style: TextStyle(fontSize: 48),)),
                GestureDetector(onTap: () => calcular('3'),child: Text('3', style: TextStyle(fontSize: 48),)),
                GestureDetector(onTap: () => calcular('-'),child: Image.asset('assets/images/subtracao.png', width: 50,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap: () => calcular('0'),child: Text('0', style: TextStyle(fontSize: 48),)),
                GestureDetector(onTap: () => calcular(','),child: Text(',', style: TextStyle(fontSize: 48),)),
                GestureDetector(onTap: () => calcular('='),child: Image.asset('assets/images/igual.png', width: 50,)),
                GestureDetector(onTap: () => calcular('+'),child: Image.asset('assets/images/soma.png', width: 90,)),
              ],
            ),
          ],
        )
    );
  }
}
