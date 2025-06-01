import 'package:flutter/material.dart';
import '../classes/disciplina.dart';
import '../widgets/disciplina_card.dart';

class Aula09Disciplinas extends StatelessWidget {
  const Aula09Disciplinas({super.key});

  @override
  Widget build(BuildContext context) {
    final disciplinas = Disciplina.gerarDisciplinas();

    return ListView.builder(
      itemCount: disciplinas.length,
      itemBuilder: (context, index) {
        return DisciplinaCard(disciplina: disciplinas[index]);
      },
    );
  }
}
