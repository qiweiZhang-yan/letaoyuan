import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/login_controller.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Get.updateLocale(const Locale("en", "US"));
              },
              child: const Text('切換英文',style: TextStyle(color: Colors.white),)),
          TextButton(
              onPressed: () {

                Get.updateLocale(const Locale('zh', 'CN'));
              },
              child: const Text('切換中文',style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              LocaleKeys.buttons_login.tr ,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              LocaleKeys.buttons_camera_action_stop_recording_hint.tr ,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              LocaleKeys.buttons_camera_load_failed.tr ,
              style: TextStyle(fontSize: 20),
            ),Text(
              LocaleKeys.buttons_sign_in_google.tr ,
              style: TextStyle(fontSize: 20),
            ),
          ],
        )
      ).onTap(() {
        Get.toNamed('home');
      }),
    );
  }
}
