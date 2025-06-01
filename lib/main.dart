import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'classes/login_details.dart';
import 'classes/aula09.dart';
import 'widgets/login_text_field.dart';
import 'widgets/tipo_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _userController;
  late TextEditingController _senhaController;
  TiposLogin _tipoCampoLogin = TiposLogin.email;
  var _senhaEscondida = true;
  var _memorizar = false;

  var _tipoLogin = [true, false, false];

  void _alterarTipoLogin(int idx) {
    setState(() {
      _tipoCampoLogin = TiposLogin.values[idx];
      _tipoLogin =
          _tipoLogin.mapIndexed((indice, _) => indice == idx).toList();
      _userController.clear();
    });
  }

  void _alterarVisibilidade() {
    setState(() {
      _senhaEscondida = !_senhaEscondida;
    });
  }

  void _fazerLogin() {
    final usuario = _userController.text.trim();
    final senha = _senhaController.text;

    if (usuario.isEmpty || senha != 'admin') {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Erro no login'),
          content: const Text('Usuário inválido ou senha incorreta.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Aula09(nomeUsuario: _userController.text.trim()),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _senhaController = TextEditingController();
  }

  @override
  void dispose() {
    _userController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/calcIcon.png", width: 150),
                const SizedBox(height: 48),
                TipoLogin(tipoLogin: _tipoLogin, onPressed: _alterarTipoLogin),
                const SizedBox(height: 16),
                LoginTextField(
                  controller: _userController,
                  tipoLogin: _tipoCampoLogin,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _senhaController,
                  obscureText: _senhaEscondida,
                  decoration: InputDecoration(
                    label: const Text("Senha"),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: _alterarVisibilidade,
                      icon: Icon(
                        _senhaEscondida
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Switch(
                      value: _memorizar,
                      onChanged: (val) {
                        setState(() {
                          _memorizar = val;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _fazerLogin,
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
