import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String mensagemAtualizada;

  const Resultado({Key? key, required this.mensagemAtualizada})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.assessment,
            size: 120,
            color: Colors.deepOrange,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              mensagemAtualizada,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Calcular novamente'),
          ),
        ],
      ),
    );
  }
}
