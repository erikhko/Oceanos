import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 19, 53, 221),
          foregroundColor: Color.fromARGB(255, 11, 216, 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Borda arredondada
          ),
          padding: const EdgeInsets.all(20),
        ),
        onPressed: quandoSelecionado,
        child: Text(
          texto,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
