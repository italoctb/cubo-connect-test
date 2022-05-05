import 'package:cubo_connect/views/menu_view.dart';
import 'package:cubo_connect/views/splash_view.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const splash = '/';
  static const menu = '/menu';

  static const diaDeCompra = '/menu/diaDeCompra';
  static const cadastro = '/menu/cadastro';

  static const criarListadeCompras = '/menu/diaDeCompra/criarListadeCompras';
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
    /*GetPage(
        name: Routes.diaDeCompra,
        page: () => DiadeCompra(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 700)),
    GetPage(
        name: Routes.cadastro,
        page: () => Cadastro(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 700)),
    GetPage(
        name: Routes.criarListadeCompras,
        page: () => CriarListaDeCompras(),
        transition: Transition.native,
        transitionDuration: const Duration(seconds: 1)),*/
  ];
}
