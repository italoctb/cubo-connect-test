import 'package:cubo_connect/models/item_pedido_model.dart';
import 'package:get/get.dart';

class ListaSalva {
  String? nome;
  RxDouble? valor;
  List<ItemPedido> listaPedidos;

  ListaSalva({this.nome, this.valor, required this.listaPedidos});
}
