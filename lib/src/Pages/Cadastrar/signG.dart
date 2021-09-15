import 'package:app/src/Config/palette.dart';

import 'package:app/src/Pages/Cadastrar/register_guide.dart';
import 'package:app/src/Pages/login/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class CadastroGuia extends StatefulWidget {
  @override
  _CadastroGuiaState createState() => _CadastroGuiaState();
}

class _CadastroGuiaState extends State<CadastroGuia> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController certificateController = TextEditingController();

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
                    "Cadastro Guia",
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Form(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: nameController,
                              style: TextStyle(color: Palette.branco),
                              decoration: InputDecoration(
                                labelText: "Nome",
                                labelStyle: TextStyle(color: Palette.branco),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                                prefixIcon:
                                    Icon(Icons.person, color: Colors.white),
                              ),
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: emailController,
                              style: TextStyle(color: Palette.branco),
                              decoration: InputDecoration(
                                labelText: "E-MAIL",
                                labelStyle: TextStyle(color: Palette.branco),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.white),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: phoneController,
                              style: TextStyle(color: Palette.branco),
                              decoration: InputDecoration(
                                labelText: "PHONE",
                                labelStyle: TextStyle(color: Palette.branco),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                                prefixIcon:
                                    Icon(Icons.phone, color: Colors.white),
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: certificateController,
                              style: TextStyle(color: Palette.branco),
                              decoration: InputDecoration(
                                labelText: "Certificado",
                                labelStyle: TextStyle(color: Palette.branco),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.white),
                              ),
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passwordController,
                              style: TextStyle(color: Palette.branco),
                              decoration: InputDecoration(
                                labelText: "E-MAIL",
                                labelStyle: TextStyle(color: Palette.branco),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.white),
                              ),
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GetBuilder<RegisterGuideController>(
                              init: RegisterGuideController(),
                              initState: (_) {},
                              builder: (controller) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () => Get.to(LoginPage()),
                                        child: Text("Cancelar")),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            elevation: 0,
                                            primary:
                                                Palette.cinzaClaroTransparente),
                                        onPressed: () {
                                          controller.registerGuide(
                                              emailController.text,
                                              passwordController.text,
                                              nameController.text,
                                              phoneController.text,
                                              certificateController.text);
                                        },
                                        child: Text("cadastrar")),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class AddGuide extends StatefulWidget {
  AddGuide({Key? key}) : super(key: key);

  @override
  _AddGuideState createState() => _AddGuideState();
}

class _AddGuideState extends State<AddGuide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
