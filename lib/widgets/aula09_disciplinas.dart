import 'package:flutter/material.dart';
import 'package:calculadoraativ/classes/disciplina.dart';
import 'package:calculadoraativ/widgets/disciplina_card.dart';

class Aula09Disciplinas extends StatelessWidget {
  Aula09Disciplinas({super.key});

  final disciplinas = Disciplina.gerarDisciplinas();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: disciplinas.length,
      itemBuilder: (context, index) {
        return DisciplinaCard(disciplina: disciplinas[index]);
      },
    );
  }
}
