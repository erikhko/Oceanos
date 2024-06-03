import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    super.key,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        Wrap(
          spacing: 7.0, // Espaçamento entre blocos
          runSpacing: 7.0, // Espaçamento entre linhas
          children: respostas.map((resp) {
            return SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 10, // Tamanho de cada bloco
              child: Resposta(
                resp['texto'] as String,
                () => quandoResponder(resp['pontuacao'] as int),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
