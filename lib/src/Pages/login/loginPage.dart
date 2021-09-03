import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/Cadastrar/choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //gato para tirar erro do Render---
      // resizeToAvoidBottomInset: false,
      //----------------------------------
      body: Container(
        //width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Ceu.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(36, 117, 252, 20), BlendMode.modulate)),
        ),
        //Tirei o Safe Area
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(children: [
            //LogoR aqui vvvvv diminuir tamanho

            Image.asset(
              'assets/images/LogoR.png',
              width: 176,
              height: 57,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                left: 36,
                bottom: 20,
              ),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(.18)),
                margin: EdgeInsets.only(left: 16, right: 16),
                width: context.width,
                height: 280,
                //height: context.height,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 15,
                              top: 20,
                              left: 15,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "E-MAIL:",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextFormField(
                            validator: (String? value) {
                              return (value != null && value.contains('@'))
                                  ? "E-mail inválido"
                                  : null;
                            },
                            decoration: InputDecoration(
                              hintText: "TESTE@TESTE.COM",
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
                                  Icon(Icons.email, color: Colors.white),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 5,
                              top: 5,
                              left: 15,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Senha:",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
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
                          ConstrainedBox(
                            constraints:
                                BoxConstraints.tightFor(width: context.width),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () => Get.to(ChoicePage()),
                                    child: Text("Cadastrar")),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      elevation: 0,
                                      primary: Palette.cinzaClaroTransparente),
                                  onPressed: () {},
                                  child: Text("Login"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
