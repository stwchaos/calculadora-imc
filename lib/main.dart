import 'package:flutter/material.dart';
import 'package:imc_calculator/resultado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de imc - atividade',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  double? imc;

  String mensagem = 'Digite o que se pede para obter um resultado';

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        mensagem = "Digite números positivos!";
      });
      return;
    }
    setState(() {
      imc = weight / (height * height);
      if (imc! < 18.5) {
        mensagem = "Abaixo do peso";
      } else if (imc! >= 18.5 && imc! <= 24.9) {
        mensagem = 'Peso normal';
      } else if (imc! >= 25 && imc! <= 29.9) {
        mensagem = "Sobrepeso";
      } else if (imc! >= 30 && imc! <= 34.9) {
        mensagem = "Obesidade grau 1";
      } else if (imc! >= 35 && imc! <= 39.9) {
        mensagem = "Obesidade grau 2";
      } else if (imc! > 40) {
        mensagem = "Obesidade 3";
      }
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => Resultado(mensagem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: SizedBox(
          width: 320,
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Altura (m)'),
                  controller: _heightController,
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                  ),
                  controller: _weightController,
                ),
                ElevatedButton(
                  onPressed: _calculate,
                  child: const Text('Calcular'),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
