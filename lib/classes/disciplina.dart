class Disciplina {
  final String codigo;
  final String nome;
  final String professor;

  Disciplina({
    required this.codigo,
    required this.nome,
    required this.professor,
  });

  static List<Disciplina> gerarDisciplinas() {
    return [
      Disciplina(codigo: 'PDM001', nome: 'Programação para Dispositivos Móveis', professor: 'Prof. Dourado'),
      Disciplina(codigo: 'BD002', nome: 'Banco de Dados', professor: 'Prof. Polido'),
      Disciplina(codigo: 'WEB003', nome: 'Desenvolvimento Web', professor: 'Prof. Anisio'),
    ];
  }
}
