import 'package:conversor_moeda/app/components/currency_box.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController = HomeController(toText, fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //padding: //inserir margim esquerda, direita, top e inferior
        //const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: [
            Image.asset(
              'assets/imagens/logo.png', //logo imagem
              width: 150, //tamanho da mesma
              height: 150,
            ),
            SizedBox(
              height: 35,
            ),
            CurrencyBox(
              selectedItem: homeController.toCurrency,
              items: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.toCurrency = model;
                });
              },
              controller: toText,
            ), //componentização do box de selecinar e inserir
            SizedBox(
              height: 15,
            ),
            CurrencyBox(
              selectedItem: homeController.fromCurrency,
              items: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.fromCurrency = model;
                });
              },
              controller: fromText,
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
                //button de realizar a ação
                style: ElevatedButton.styleFrom(
                  // estilo para o botão
                  shape: const StadiumBorder(),
                  primary: Colors.amber,
                ),
                onPressed: () {
                  homeController.convert();
                },
                child: Text(
                  'CONVERTER',
                  style: TextStyle(
                    //estilo para o texto do botão
                    color: Color.fromARGB(255, 105, 56, 9),
                    fontSize: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
