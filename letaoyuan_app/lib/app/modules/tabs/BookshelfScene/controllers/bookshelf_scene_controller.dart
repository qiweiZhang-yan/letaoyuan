import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
class BookshelfSceneController extends GetxController {
  //TODO: Implement BookshelfSceneController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  int pageNum = 1;
  int pageSize = 10;
  void onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  void onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length+1).toString());
    update();

    refreshController.loadComplete();
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
