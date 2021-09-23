import 'dart:async';
import 'dart:io';

import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Server/Grpc/grpc_server_connection_builder.dart';
import 'package:app/src/Server/credentials.dart';
import 'package:app/src/Server/register_server_connection_interface.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  var builder = GrpcServerConnectionBuilder("192.168.0.2", 50051);
  var connection = await builder.connectTourist(Credentials("test@orion.com.br", "1234"));
  runApp(ChangePicture(connection));
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
              _future = _reg.registerTourist(emailController.text, passwordController.text, nameController.text, "666");
            })
          },
          child: Text("Registrar")
        ),
      ] + (info != null ? [Text(info)] : [])
    );

}

class ChangePicture extends StatefulWidget {
  final TouristServerConnectionInterface connection;
  ChangePicture(this.connection);
  @override
  _ChangePictureState createState() => _ChangePictureState(connection);
}

class _ChangePictureState extends State<ChangePicture> {
  final TouristServerConnectionInterface connection;
  String? url;
  Future<TouristModel> touristFuture;
  Future<String?>? _future;
  final ImagePicker _picker = ImagePicker();

  _ChangePictureState(this.connection) : touristFuture = connection.getTouristData();

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      body: Container(
        child: ListView(
          children: [
            FutureBuilder(
              future: touristFuture,
              builder: (context, AsyncSnapshot<TouristModel> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.data == null) {
                      return Image.asset("assets/images/SP.jpg");
                    }
                    return Image.network(
                      snapshot.data!.imageUrl,
                      errorBuilder: (context, exception, stackTrace) {
                        return Text(exception.toString());
                      },
                    );
                  default:
                    return Image.asset("assets/images/SP.jpg");
                }
              },
            ),
            FutureBuilder(
              future: _future,
              builder: (context, AsyncSnapshot<String?> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return TextButton(
                      onPressed: () => setState(() {
                        _future = changePicture();
                      }),
                      child: Text("Abrir Foto.")
                    );
                  case ConnectionState.waiting:
                    return Center(child: Text("Requisitando mudança..."),);
                  default:
                    _future = null;
                    return TextButton(
                      onPressed: () => setState(() {
                        _future = changePicture();
                      }),
                      child: Text("Abrir Foto.")
                  );
                }
              }
            )
          ],
        ),
      )
    ),
  );

  Future<String?> changePicture() async {
    var img = await _picker.pickImage(source: ImageSource.gallery);
    if (img == null)
      return null;
    var file = File(img.path);
    var url = await connection.updateProfilePicture(file);
    setState(() {
      touristFuture = connection.getTouristData();
    });
    return url;
  }

}
