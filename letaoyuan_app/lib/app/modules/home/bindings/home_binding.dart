import 'package:get/get.dart';

import '../../tabs/BookshelfScene/controllers/bookshelf_scene_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BookshelfSceneController>(
          () => BookshelfSceneController(),
    );
  }
}
