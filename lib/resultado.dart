import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {

  String mensagem = "";
  Resultado(this.mensagem);

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "${widget.mensagem}",
        textAlign: TextAlign.center,
    ));
  }
}
