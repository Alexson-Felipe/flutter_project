import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue),
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}
