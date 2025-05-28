import 'package:calculadoraativ/classes/login_details.dart';
import 'package:calculadoraativ/widgets/login_text_field.dart';
import 'package:calculadoraativ/widgets/tipo_login.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

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
          _tipoLogin.mapIndexed((indice, chave) => indice == idx).toList();

      _userController.text = '';
    });
  }

  void _alterarVisibilidade() {
    setState(() {
      _senhaEscondida = !_senhaEscondida;
    });
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(width: 150, "assets/images/calcIcon.png"),
              SizedBox(height: 48),
              TipoLogin(tipoLogin: _tipoLogin, onPressed: _alterarTipoLogin),
              SizedBox(height: 16),
              LoginTextField(
                controller: _userController,
                tipoLogin: _tipoCampoLogin,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _senhaController,
                obscureText: _senhaEscondida,
                decoration: InputDecoration(
                  label: Text("Senha"),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: _alterarVisibilidade,
                    icon: Icon(
                      _senhaEscondida ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch(
                    value: _memorizar,
                    onChanged: (bool) {
                      setState(() {
                        _memorizar = !_memorizar;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Center(child: Text("Login")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
