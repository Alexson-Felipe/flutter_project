import 'package:flutter/material.dart';
import 'package:projeto_flutter/questionario.dart';
import 'package:projeto_flutter/resultado.dart';

main() => runApp(PerguntaAPP());

class _PerguntaAppState extends State<PerguntaAPP> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'ponto': 10},
        {'texto': 'Vermelho', 'ponto': 5},
        {'texto': 'Verde', 'ponto': 3},
        {'texto': 'Branco', 'ponto': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'ponto': 10},
        {'texto': 'Cobra', 'ponto': 5},
        {'texto': 'Elefante', 'ponto': 3},
        {'texto': 'Leão', 'ponto': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'ponto': 10},
        {'texto': 'João', 'ponto': 5},
        {'texto': 'Leo', 'ponto': 3},
        {'texto': 'Pedro', 'ponto': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntaAPP extends StatefulWidget {
  //Convertenado um componente de stateless para stateful
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
