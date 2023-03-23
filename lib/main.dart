import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String infoText = "...";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  Widget buildTextField(String label, TextEditingController c) {
    return TextField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black, fontSize: 30.0),
          border: const OutlineInputBorder()),
      style: const TextStyle(color: Colors.black, fontSize: 25.0),
      keyboardType: TextInputType.number,
      controller: c,
    );
  }

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      infoText;
    });
  }

  void _calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    double imc = weight / (height * height);
    setState(() {
      if (imc < 18.5) {
        infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.5 && imc <= 24.9) {
        infoText = "Peso normal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 25 && imc <= 29.9) {
        infoText = "Sobrepeso(${imc.toStringAsPrecision(4)})";
      } else if (imc >= 30 && imc <= 34.9) {
        infoText = "Obesidade grau 1 (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 35 && imc <= 39.9) {
        infoText = "Obesidade grau 2 (${imc.toStringAsPrecision(4)})";
      } else if (imc > 40) {
        infoText = "Obesidade 3 (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text("Calculadora IMC"),
            centerTitle: true,
            actions: <Widget>[Container()]),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.deepPurpleAccent,
                      blurRadius: 1000,
                      spreadRadius: 250,
                      offset: Offset(8, 8))
                ]),
                child: const Icon(
                  Icons.accessibility_sharp,
                  size: 200.0,
                  color: Colors.white,
                ),
              ),
              buildTextField('Peso (em kg) ', weightController),
              const Divider(),
              buildTextField('Altura (em metros)', heightController),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _calculate();
                  }, child: Text("Calcular"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Text(
                  infoText,
                  style: const TextStyle(color: Colors.black, fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
