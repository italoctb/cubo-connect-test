import 'package:cubo_connect/models/lista_salva_model.dart';
import 'package:cubo_connect/models/produto_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../config/app_routes.dart';
import '../models/item_pedido_model.dart';

class AppController extends GetxController {
  RxList<Produto> listaProdutos = <Produto>[].obs;
  RxList<ItemPedido> listaPedidos = <ItemPedido>[].obs;
  RxList<ListaSalva> listasSalvas = <ListaSalva>[].obs;
  TextEditingController nomeProdutoController = TextEditingController();
  TextEditingController valorProdutoController = TextEditingController();
  RxString nomeListaEditada = "".obs;
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

  void salvarLista(BuildContext context, List<ItemPedido> lista, double valor) {
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
                      listasSalvas.add(ListaSalva(
                          nome: campo.text,
                          valor: valor.obs,
                          listaPedidos: lista));
                      Navigator.pop(context);
                      Navigator.pop(context);
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

  void editarLista(ListaSalva lista) {
    nomeListaEditada.value = lista.nome!;
    listaPedidos.clear();
    for (var item in listaProdutos) {
      listaPedidos.add(ItemPedido(produto: item, selecionado: false.obs));
      for (var i in lista.listaPedidos) {
        if (i.produto == item) {
          listaPedidos.removeLast();
          listaPedidos
              .add(ItemPedido(produto: i.produto, selecionado: i.selecionado));
        }
      }
    }
    Get.toNamed(Routes.editarListadeCompras);
  }

  void salvarListaEditada(BuildContext context) {
    int index = 0;
    for (var item in listasSalvas) {
      if (item.nome != nomeListaEditada.value) {
        index++;
      }
    }
    listasSalvas[index].listaPedidos = listaPedidos.toList();
    listasSalvas[index].valor!.value =
        double.parse(valorLista(listaPedidos).value);
    Navigator.pop(context);
  }
}
