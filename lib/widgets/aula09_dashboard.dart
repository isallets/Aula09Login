import 'package:flutter/material.dart';
import 'package:calculadoraativ/classes/disciplina.dart';
import 'package:calculadoraativ/widgets/disciplina_card.dart';
import 'dart:math';

class Aula09Dashboard extends StatelessWidget {
  final String nomeUsuario;

  const Aula09Dashboard({super.key, required this.nomeUsuario});

  @override
  Widget build(BuildContext context) {
    final disciplinas = Disciplina.gerarDisciplinas();
    final aleatoria = disciplinas[Random().nextInt(disciplinas.length)];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bem-vindo, $nomeUsuario!',
              style: TextStyle(fontSize: 24)),
                SizedBox(height: 32),
                Text('Sugestão de disciplina para hoje:',
              style: TextStyle(fontSize: 18)),
          DisciplinaCard(disciplina: aleatoria),
        ],
      ),
    );
  }
}
