import 'package:get/get.dart';

import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Welcome/bindings/welcome_binding.dart';
import '../modules/Welcome/views/welcome_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/tabs/BookshelfScene/bindings/bookshelf_scene_binding.dart';
import '../modules/tabs/BookshelfScene/views/bookshelf_scene_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BOOKSHELF_SCENE,
      page: () => const BookshelfSceneView(),
      binding: BookshelfSceneBinding(),
    ),
  ];
}
