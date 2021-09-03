import 'dart:async';

import 'package:app/src/Server/Grpc/grpc_server_connection_builder.dart';
import 'package:app/src/Server/credentials.dart';
import 'package:app/src/Server/register_server_connection_interface.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  var builder = GrpcServerConnectionBuilder("192.168.0.2", 50051);
  //runApp(LoginApp(builder));
  runApp(RegisterApp(await builder.connectRegister()));
}

class LoginApp extends StatefulWidget {
  final ServerConnectionBuilderInterface _builder;
  LoginApp(this._builder);
  @override
  _LoginAppState createState() => _LoginAppState(_builder);
}

class _LoginAppState extends State<LoginApp> {
  final ServerConnectionBuilderInterface _builder;
  Future<TouristServerConnectionInterface>? _future;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  _LoginAppState(this._builder);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: FutureBuilder(
            future: _future,
            builder: (BuildContext context, AsyncSnapshot<TouristServerConnectionInterface> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return loginForm(null);
                case ConnectionState.waiting:
                  return Center(child: Text("Conectando"),);
                case ConnectionState.done:
                  if (snapshot.data == null)
                  {
                    _future = null;
                    return loginForm("Falha ao conectar");
                  }
                  return Center(child: Text("Conectado!"),);
                default:
                  setState(() => _future = null);
                  return Text("Falha ao conectar");
              }
            }
          ),
        )
      ),
    );
  }

  Widget loginForm(String? info) =>
    ListView(
        children: [
          Text("Email"),
          TextField(controller: userController,),
          Text("Senha"),
          TextField(controller: passwordController, obscureText: true,),
          TextButton(
            onPressed: () => {
              setState(() {
                _future = _builder.connectTourist(Credentials(userController.text, passwordController.text));
              })
            },
            child: Text("Login")
          ),
        ] + (info != null ? [Text(info)] : [])
    );

}

class RegisterApp extends StatefulWidget {
  final RegisterServerConnectionInterface _reg;
  RegisterApp(this._reg);
  @override
  _RegisterAppState createState() => _RegisterAppState(_reg);
}

class _RegisterAppState extends State<RegisterApp> {
  final RegisterServerConnectionInterface _reg;
  final TextEditingController nameController = TextEditingController();
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
                  return Center(child: Text("Requisitando cadastro"),);
                case ConnectionState.done:
                  if (snapshot.data == null)
                  {
                    _future = null;
                    return registerForm("Falha ao conectar");
                  }
                  return Center(child: Text("Registrado!"),);
                default:
                  setState(() => _future = null);
                  return Text("Falha ao cadastrar");
              }
            }
          ),
        )
      ),
    );
  }

  Widget registerForm(String? info) =>
    ListView(
      children: [
        Text("Nome"),
        TextField(controller: nameController,),
        Text("Email"),
        TextField(controller: emailController,),
        Text("Senha"),
        TextField(controller: passwordController, obscureText: true,),
        TextButton(
          onPressed: () => {
            setState(() {
              _future = _reg.registerTourist(emailController.text, passwordController.text, nameController.text);
            })
          },
          child: Text("Registrar")
        ),
      ] + (info != null ? [Text(info)] : [])
    );

}
