import 'package:flutter/material.dart';
import '../widgets/aula09_disciplinas.dart';
import '../widgets/aula09_dashboard.dart';

class Aula09 extends StatefulWidget {
  final String nomeUsuario;

  const Aula09({super.key, required this.nomeUsuario});

  @override
  State<Aula09> createState() => _Aula09State();
}

class _Aula09State extends State<Aula09> {
  int _paginaSelecionada = 0;

  late List<Widget> _telas;

  @override
  void initState() {
    super.initState();
    _telas = [
      Aula09Dashboard(nomeUsuario: widget.nomeUsuario),
      const Aula09Disciplinas(),
      const Center(child: Text('Saindo...')),
    ];
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Deseja realmente sair?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Sair'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        _paginaSelecionada = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        body: _telas[_paginaSelecionada],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _paginaSelecionada,
          onTap: _onItemTapped,
          selectedItemColor: Colors.deepPurple,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Disciplinas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Sair',
            ),
          ],
        ),
      ),
    );
  }
}
