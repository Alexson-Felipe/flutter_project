import 'package:flutter/material.dart';

void main() => runApp(PerguntaAPP());

class PerguntaAPP extends StatelessWidget {
  void responder() {
    print('Pergunta respondida!');
  }

  void Function() funcaoQueRetornaOutraFuncao() {
    return () {
      print('Pergunta respondida da funcao!');
    };
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Text(perguntas[0]),
            ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Resposta 2'),
              onPressed: () => responder,
            ),
            ElevatedButton(
              child: Text('Resposta 3'),
              onPressed: funcaoQueRetornaOutraFuncao(),
            )
          ],
        ),
      ),
    );
  }
}
