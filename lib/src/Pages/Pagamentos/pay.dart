import 'package:app/src/Config/palette.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

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
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [BackButtonWidget(title: "Pagamento")],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 328,
              height: 109,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Palette.cinzaTransparente,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Container(
                      alignment: Alignment.center,
                      width: 78,
                      height: 29,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Palette.cinzaTransparente,
                      ),
                      child: Text(
                        "TAG",
                        style: TextStyle(fontSize: 12, color: Palette.branco),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Nome do roteiro",
                      style: TextStyle(fontSize: 28, color: Palette.branco),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "4h de duração prevista",
                      style: TextStyle(fontSize: 12, color: Palette.cinzaClaro),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Titular do cartão"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 327,
              height: 47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Palette.cinzaTransparente,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Numero do cartão"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 327,
              height: 47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Palette.cinzaTransparente,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 48,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.84),
                      color: Palette.cinza,
                    ),
                    child: Icon(
                      FontAwesomeIcons.ccMastercard,
                      color: Palette.branco,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Data de validade"),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        // obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("CVV"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 120,
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Preço: "),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 237,
                        height: 78,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente,
                        ),
                      ),
                      Container(
                        width: 219,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Get.back(), child: Text("Cancelar")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 0,
                          primary: Palette.cinzaClaroTransparente),
                      onPressed: () {},
                      child: Text("Confirmar")),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
