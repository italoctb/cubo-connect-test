import 'package:cubo_connect/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/botao_padrao_widget.dart';

// ignore: must_be_immutable
class DiaDeCompra extends StatelessWidget {
  DiaDeCompra({Key? key}) : super(key: key);
  AppController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubo Connect - Dia de compra"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Lista de compras",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.64,
              child: Obx(() => ListView.builder(
                  itemCount: controller.listasSalvas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.list_alt_sharp),
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.listasSalvas[index].nome ??
                                  "nulo"),
                            ]),
                        trailing: Obx(() => Text(
                              "R\$" +
                                  controller.listasSalvas[index].valor!.value
                                      .toString(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                            )),
                        onTap: () => controller
                            .editarLista(controller.listasSalvas[index]),
                      ),
                    );
                  })),
            ),
            const SizedBox(
              height: 20,
            ),
            BotaoPadrao(
                text: "Nova Lista", onPressed: () => controller.novaLista()),
          ],
        ),
      ),
    );
  }
}
