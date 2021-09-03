import 'package:app/src/Config/palette.dart';

import 'package:app/src/Pages/login/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroGuia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Ceu.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(36, 117, 252, 20), BlendMode.modulate)),
        ),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/LogoR.png',
              width: 176,
              height: 80,
              fit: BoxFit.fitHeight,
            ),
            // SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cadastrar",
                      style: TextStyle(fontSize: 40, color: Palette.branco)),
                  CircleAvatar(
                    radius: 30,
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(.18)),
                margin: EdgeInsets.only(left: 16, right: 16),
                height: 585,

                //height: context.height,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            /*validator: (String? value) {
                                return (value != null && value.contains('@'))
                                    ? "Email deve conter @ para ser valido"
                                    : null;
                              },*/
                            decoration: InputDecoration(
                              labelText: "NOME",
                              labelStyle: TextStyle(color: Palette.branco),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white38),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.white),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            /*validator: (String? value) {
                                return (value != null && value.contains('@'))
                                    ? "Email deve conter @ para ser valido"
                                    : null;
                              },*/
                            decoration: InputDecoration(
                              labelText: "E-MAIL",
                              labelStyle: TextStyle(color: Palette.branco),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white38),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.white),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            /*validator: (String? value) {
                                return (value != null && value.contains('@'))
                                    ? "Email deve conter @ para ser valido"
                                    : null;
                              },*/
                            decoration: InputDecoration(
                              labelText: "CONFIRMAÇÃO DO E-MAIL:",
                              labelStyle: TextStyle(color: Palette.branco),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white38),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.white),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            /*validator: (String? value) {
                                return (value != null && value.contains('@'))
                                    ? "Email deve conter @ para ser valido"
                                    : null;
                              },*/
                            decoration: InputDecoration(
                                labelText: 'CERTIFICADO',
                                labelStyle: TextStyle(color: Palette.branco),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.white38),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                suffixIcon: (Icon(
                                  Icons.picture_as_pdf,
                                  color: Palette.branco,
                                ))),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "TELEFONE",
                              labelStyle: TextStyle(color: Palette.branco),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white38),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon:
                                  Icon(Icons.phone, color: Colors.white),
                              /*suffixIcon: IconButton(
                                  onPressed(){};
                        
                                ),*/
                            ),
                            keyboardType: TextInputType.phone,
                            //obscureText: true,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "SENHA",
                              labelStyle: TextStyle(color: Palette.branco),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white38),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon: Icon(Icons.lock, color: Colors.white),
                              /*suffixIcon: IconButton(
                                  onPressed(){};
                        
                                ),*/
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "CONFIRMAÇÃO DE SENHA",
                              labelStyle: TextStyle(color: Palette.branco),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.white38),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              prefixIcon: Icon(Icons.lock, color: Colors.white),
                              /*suffixIcon: IconButton(
                                  onPressed(){};
                        
                                ),*/
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tightFor(width: context.width),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () => Get.to(LoginPage()),
                                    child: Text('Já sou cadastrado')),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      elevation: 0,
                                      primary: Palette.cinzaClaroTransparente),
                                  onPressed: () {},
                                  child: Text("Cadastrar"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
