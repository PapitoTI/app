import 'package:app/src/Server/register_server_connection_interface.dart';
import 'package:flutter/material.dart';

class RegisterApp extends StatefulWidget {
  final RegisterServerConnectionInterface _reg;
  RegisterApp(this._reg);
  @override
  _RegisterAppState createState() => _RegisterAppState(_reg);
}

class _RegisterAppState extends State<RegisterApp> {
  final RegisterServerConnectionInterface _reg;
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<int>? _future;

  _RegisterAppState(this._reg);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        child: FutureBuilder(
            future: _future,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return registerForm(null);
                case ConnectionState.waiting:
                  return Center(
                    child: Text("Requisitando cadastro"),
                  );
                case ConnectionState.done:
                  if (snapshot.data == null) {
                    _future = null;
                    return registerForm("Falha ao conectar");
                  }
                  return Center(
                    child: Text("Registrado!"),
                  );
                default:
                  setState(() => _future = null);
                  return Text("Falha ao cadastrar");
              }
            }),
      )),
    );
  }

  Widget registerForm(String? info) => ListView(
      children: [
            Text("Celular"),
            TextField(
              controller: phoneController,
            ),
            Text("Nome"),
            TextField(
              controller: nameController,
            ),
            Text("Email"),
            TextField(
              controller: emailController,
            ),
            Text("Senha"),
            TextField(
              controller: passwordController,
              obscureText: true,
            ),
            TextButton(
                onPressed: () => {
                      setState(() {
                        _future = _reg.registerTourist(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                            phoneController.text);
                      })
                    },
                child: Text("Registrar")),
          ] +
          (info != null ? [Text(info)] : []));
}
