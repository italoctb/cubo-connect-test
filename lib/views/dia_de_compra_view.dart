import 'package:cubo_connect/config/app_routes.dart';
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
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Dia de compra",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: TextFormField(
                    controller: controller.nomeProdutoController,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: "Nome do Item",
                      prefixIcon: const Icon(Icons.format_list_numbered),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val == "") {
                        return "Nome do Item é obrigatório!";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.valorProdutoController,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: "Valor",
                      prefixIcon: const Icon(Icons.credit_card),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val == "") {
                        return "Valor é obrigatório!";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          BotaoPadrao(
            text: "Adicionar uma Lista",
            onPressed: () => controller.novaLista(),
          ),
        ],
      ),
    );
  }
}
