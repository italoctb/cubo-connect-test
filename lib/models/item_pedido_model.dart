import 'package:cubo_connect/models/produto_model.dart';
import 'package:get/get.dart';

import 'produto_model.dart';

class ItemPedido {
  Produto produto;
  RxBool selecionado;

  ItemPedido({required this.produto, required this.selecionado});
}
