import 'package:cubo_connect/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/botao_padrao_widget.dart';

// ignore: must_be_immutable
class CriarListaDeCompras extends StatelessWidget {
  CriarListaDeCompras({Key? key}) : super(key: key);
  AppController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubo Connect - Criar lista"),
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
              height: MediaQuery.of(context).size.height * 0.58,
              child: Obx(() => ListView.builder(
                  itemCount: controller.listaPedidos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: Obx(() => Checkbox(
                              value: controller
                                  .listaPedidos[index].selecionado.value,
                              onChanged: (value) {
                                controller.listaPedidos[index].selecionado
                                    .value = value as bool;
                              },
                            )),
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.listaPedidos[index].produto.nome),
                              Text(
                                "Valor: R\$" +
                                    controller.listaPedidos[index].produto.valor
                                        .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800),
                              ),
                            ]),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () =>
                              controller.listaPedidos.removeAt(index),
                        ),
                      ),
                    );
                  })),
            ),
            Card(
              color: const Color.fromARGB(255, 182, 188, 196),
              child: ListTile(
                title: const Text(
                  "Total da lista: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Obx(() => Text(
                      "R\$" +
                          controller.valorLista(controller.listaPedidos).value,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BotaoPadrao(
              text: "Salvar lista",
              onPressed: () => controller.salvarLista(
                  context,
                  controller.listaPedidos.toList(),
                  double.parse(
                      controller.valorLista(controller.listaPedidos).value)),
            ),
          ],
        ),
      ),
    );
  }
}
