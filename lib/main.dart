import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual tecnologia pode ajudar na limpeza dos oceanos?',
      'respostas': [
        {'texto': 'Drones aquáticos', 'pontuacao': 10},
        {'texto': 'Submarinos tripulados', 'pontuacao': 5},
        {'texto': 'Navios cargueiros', 'pontuacao': 3},
        {'texto': 'Redes de pesca', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual inovação pode reduzir a poluição marinha?',
      'respostas': [
        {'texto': 'Filtros em redes de esgoto', 'pontuacao': 10},
        {'texto': 'Desenvolvimento de ilhas artificiais', 'pontuacao': 5},
        {'texto': 'Aumento do transporte marítimo', 'pontuacao': 3},
        {'texto': 'Expansão de portos', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual método pode ajudar a reduzir a pesca ilegal?',
      'respostas': [
        {'texto': 'Drones de vigilância', 'pontuacao': 10},
        {'texto': 'Sistemas de monitoramento', 'pontuacao': 5},
        {'texto': 'Expansão de áreas de pesca', 'pontuacao': 3},
        {'texto': 'Aumento da frota pesqueira', 'pontuacao': 1},
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
          title: const Text('Preservando os Oceanos'),
          backgroundColor: Colors.blue, // Cor da barra de menu (AppBar)
        ),
        backgroundColor: Colors.blue, // Cor de fundo da tela principal
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
