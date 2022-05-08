import 'package:cubo_connect/models/lista_salva_model.dart';
import 'package:cubo_connect/models/produto_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_routes.dart';
import '../models/item_pedido_model.dart';

class AppController extends GetxController {
  RxList<Produto> listaProdutos = <Produto>[].obs;
  RxList<ItemPedido> listaPedidos = <ItemPedido>[].obs;
  RxList<ListaSalva> listaSalva = <ListaSalva>[].obs;
  TextEditingController nomeProdutoController = TextEditingController();
  TextEditingController valorProdutoController = TextEditingController();

  void salvarItem(BuildContext context) {
    Produto produto = Produto(
        nome: nomeProdutoController.text,
        valor: double.parse(valorProdutoController.text));
    listaProdutos.add(produto);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text("Salvo com sucesso")),
            content: SizedBox(
              height: 80,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Nome do produto: "),
                    Text(
                      "  " + produto.nome,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Valor do produto: R\$" + produto.valor.toString())
                  ]),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      nomeProdutoController.clear();
                      valorProdutoController.clear();
                    },
                    child: const Text("OK!"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red.shade700),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey))),
                    )),
              ),
            ],
          );
        });
  }

  void novaLista() {
    listaPedidos.clear();
    for (var item in listaProdutos) {
      listaPedidos.add(ItemPedido(produto: item, selecionado: true.obs));
    }
    Get.toNamed(Routes.criarListadeCompras);
  }

  RxString valorLista(RxList<ItemPedido> list) {
    double soma = 0;
    for (var obj in list) {
      if (obj.selecionado.value) {
        soma += obj.produto.valor;
      }
    }
    return soma.toString().obs;
  }

  void salvarLista(
      BuildContext context, RxList<ItemPedido> lista, double valor) {
    TextEditingController campo = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text("Salvar lista")),
            content: SizedBox(
              height: 80,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: campo,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Nome da lista",
                        prefixIcon: const Icon(Icons.list_alt),
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
                  ]),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      listaSalva.add(ListaSalva(
                          nome: campo.text, valor: valor, listaPedidos: lista));
                    },
                    child: const Text("Salvar lista"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red.shade700),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey))),
                    )),
              ),
            ],
          );
        });
  }
}
