import 'package:flutter/material.dart';
import 'package:projeto_flutter/questao.dart';
import 'package:projeto_flutter/respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final Function(int) responder;

  const Questionario(
      { //
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder,
      super.key //
      });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas
            .map((resp) => Resposta(resp['texto'].toString(),
                () => responder(int.parse(resp['ponto'].toString()))))
            .toList(),
      ],
    );
  }
}
