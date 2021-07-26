import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginP extends StatelessWidget {
  get child => null;

  get decoration => null;

  @override
  Widget build(BuildContext context) {
    var tecladoAberto = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Color(0xFF0d1441),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            tecladoAberto
                ? SizedBox()
                : Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          FontAwesomeIcons.battleNet,
                          color: Colors.white,
                          size: 50,
                        ),
                        /* SizedBox(
                    width: 10,
                  ),*/
                        Text(
                          "rion",
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
            Expanded(
              flex: 4,
              child: Container(
                color: Color(0xFFFFFFFF).withOpacity(0.2),
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bem-vindo, Viajante!",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Informe seus dados para acesso para entrar no aplicativo ",
                      style: TextStyle(
                          //fontSize: 18,
                          color: Color(0xFFFFFFFF).withOpacity(0.7),
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFFFFFF).withOpacity(0.7),
                          fontStyle: FontStyle.italic,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFFFFFFFF).withOpacity(0.3),
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFFFFFFFF),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Senha",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFFFFFF).withOpacity(0.7),
                          fontStyle: FontStyle.italic,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFFFFFFFF).withOpacity(0.3),
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFFFFFFFF),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () => null,
                    child: Text('Entrar',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                        )),
                    color: Color(0xFFE0C8C8).withOpacity(.24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  Text('Esqueceu sua senha ?',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontStyle: FontStyle.italic,
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Ainda não tem uma conta ?',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF).withOpacity(0.6),
                        fontStyle: FontStyle.italic,
                      )),
                  Text('Cria uma conta',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontStyle: FontStyle.italic,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
