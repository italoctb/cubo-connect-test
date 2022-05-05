import 'package:cubo_connect/models/produto_model.dart';

import 'produto_model.dart';

class ItemPedido {
  Produto produto;
  bool selecionado;

  ItemPedido({required this.produto, required this.selecionado});
}
