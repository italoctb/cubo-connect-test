import 'package:cubo_connect/views/cadastro_view.dart';
import 'package:cubo_connect/views/criar_lista_de_compra_view.dart';
import 'package:cubo_connect/views/dia_de_compra_view.dart';
import 'package:cubo_connect/views/menu_view.dart';
import 'package:cubo_connect/views/splash_view.dart';
import 'package:get/get.dart';

import '../views/editar_lista_de_compra_view.dart';

abstract class Routes {
  static const splash = '/';
  static const menu = '/menu';

  static const diaDeCompra = '/menu/diaDeCompra';
  static const cadastro = '/menu/cadastro';

  static const criarListadeCompras = '/menu/diaDeCompra/criarListadeCompras';
  static const editarListadeCompras = '/menu/diaDeCompra/editarListadeCompras';
}

abstract class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
        name: Routes.splash,
        page: () => const Splash(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(seconds: 2)),
    GetPage(
        name: Routes.menu,
        page: () => const Menu(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 700)),
    GetPage(
        name: Routes.diaDeCompra,
        page: () => DiaDeCompra(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 700)),
    GetPage(
        name: Routes.cadastro,
        page: () => Cadastro(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 700)),
    GetPage(
        name: Routes.criarListadeCompras,
        page: () => CriarListaDeCompras(),
        transition: Transition.native,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: Routes.editarListadeCompras,
        page: () => EditarListaDeCompras(),
        transition: Transition.native,
        transitionDuration: const Duration(seconds: 1)),
  ];
}
