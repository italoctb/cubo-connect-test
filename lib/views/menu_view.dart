import 'package:cubo_connect/config/app_routes.dart';
import 'package:cubo_connect/views/widgets/botao_padrao_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubo Connect - Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BotaoPadrao(
              text: "Cadastro",
              onPressed: () => Get.toNamed(Routes.cadastro),
            ),
            const SizedBox(
              height: 20,
            ),
            BotaoPadrao(
              text: "Dia de Compra",
              onPressed: () => Get.toNamed(Routes.diaDeCompra),
            ),
          ],
        ),
      ),
    );
  }
}
