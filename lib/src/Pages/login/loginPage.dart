import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/Cadastrar/choice.dart';
import 'package:app/src/Pages/login/validators.dart';
import 'package:app/src/application/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends GetWidget<LoginController> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/LogoR.png',
                width: 176,
                height: 57,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: 80),
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
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(.18)),
                margin: EdgeInsets.only(left: 16, right: 16),
                width: context.width,
                height: 280,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: Validatorless.multiple([
                            Validatorless.required("E-mail obrigatório"),
                            Validatorless.email("E-mail inválido")
                          ]),
                          controller: emailController,
                          style: TextStyle(color: Palette.branco),
                          decoration: InputDecoration(
                            labelText: "E-MAIL",
                            labelStyle: TextStyle(color: Palette.branco),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Icon(Icons.email, color: Colors.white),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: Validatorless.multiple([
                            Validatorless.required("Senha obrigatório"),
                            /*Validators.check(
                                passwordController, "Senha diferente")*/
                          ]),
                          style: TextStyle(color: Palette.branco),
                          decoration: InputDecoration(
                            labelText: "SENHA",
                            labelStyle: TextStyle(color: Palette.branco),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Icon(Icons.lock, color: Colors.white),
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
                                  onPressed: () {
                                    var formValid =
                                        _formKey.currentState?.validate() ??
                                            false;
                                    if (formValid) {
                                      controller.loginUser(emailController.text,
                                          passwordController.text);
                                    }
                                  },
                                  child: Text("Login")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    ));
  }
}
