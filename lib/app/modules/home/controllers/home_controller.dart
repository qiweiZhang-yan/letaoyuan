import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../http/httpUtils.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
 int tabIndex=0;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    HttpUtils.get('home_excellent');
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
