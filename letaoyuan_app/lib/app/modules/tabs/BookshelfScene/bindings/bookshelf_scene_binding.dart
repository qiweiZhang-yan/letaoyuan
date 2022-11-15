import 'package:get/get.dart';

import '../controllers/bookshelf_scene_controller.dart';

class BookshelfSceneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookshelfSceneController>(
      () => BookshelfSceneController(),
    );
  }
}
