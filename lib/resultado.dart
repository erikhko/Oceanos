import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario, {super.key});

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Explorador Iniciante';
    } else if (pontuacao < 12) {
      return 'Guardião Consciente';
    } else if (pontuacao < 16) {
      return 'Protetor Informado';
    } else {
      return 'Defensor dos Oceanos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 35,
            ),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Tentar de novo?',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 11, 216, 14), // Altera a cor do texto para branco
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue, // Adicione uma cor de fundo para o botão
          ),
        ),
      ],
    );
  }
}
