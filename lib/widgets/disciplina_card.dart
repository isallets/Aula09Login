import 'package:flutter/material.dart';
import '../classes/disciplina.dart';

class DisciplinaCard extends StatelessWidget {
  final Disciplina disciplina;

  const DisciplinaCard({super.key, required this.disciplina});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        leading: const Icon(Icons.book),
        title: Text(disciplina.nome),
        subtitle: Text('Código: ${disciplina.codigo}\nProfessor: ${disciplina.professor}'),
      ),
    );
  }
}
