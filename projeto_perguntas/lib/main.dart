import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuação': 9},
        {'texto': 'Vermelho', 'pontuação': 8},
        {'texto': 'Verde', 'pontuação': 4},
        {'texto': 'Branco', 'pontuação': 10}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuação': 10},
        {'texto': 'Cobra', 'pontuação': 9},
        {'texto': 'Elefante ', 'pontuação': 7},
        {'texto': 'Leão', 'pontuação': 8}
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuação': 5},
        {'texto': 'João', 'pontuação': 6},
        {'texto': 'Léo ', 'pontuação': 7},
        {'texto': 'Pedro', 'pontuação': 3}
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada)
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    print(_pontuacaoTotal);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder,
                )
              : Resultado()),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
