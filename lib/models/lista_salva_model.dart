import 'package:cubo_connect/models/item_pedido_model.dart';

class ListaSalva {
  String? nome;
  double? valor;
  List<ItemPedido>? listaPedidos;

  ListaSalva({this.nome, this.valor, this.listaPedidos});
}
