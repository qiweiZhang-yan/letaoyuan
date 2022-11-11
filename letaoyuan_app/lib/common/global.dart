import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:letaoyuan_app/common/constant.dart';
import 'package:letaoyuan_app/common/utils/storage.dart';
import 'package:letaoyuan_app/common/utils/wechat_kit.dart';
import 'package:quiver/strings.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:android_id/android_id.dart';

import '../http/httpUtils.dart';

/// 全局静态数据
class Global {
  /// 微信APPID
  static String weChatAppId = "wx5419683abac717df";
  ///微信Universal Links(针对IOS)
  static String universalLink = "https://api.postitchat.com/";

  /// 是否 ioszxs
  static bool isIOS = Platform.isIOS;

  /// android 设备信息
  static late AndroidDeviceInfo androidDeviceInfo;

  static late String? androidId;

  /// ios 设备信息
  static late IosDeviceInfo iosDeviceInfo;

  /// 包信息
  static late PackageInfo packageInfo;

  ///渠道信息
  static late String channelId;

  /// 是否第一次打开
  static bool? isFirstOpen;

  /// 是否离线登录
  static bool isOfflineLogin = true;

  /// 是否 release
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  ///全局路由观察者
  static RouteObserver<Route> routeObserver = RouteObserver();

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();
    // 读取设备信息
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Global.isIOS) {
      Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    } else {
      Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      androidId = await const AndroidId().getId();
      WebView.platform = SurfaceAndroidWebView();
    }


    // 包信息
    Global.packageInfo = await PackageInfo.fromPlatform();

    // 本地存储初始化
    await StorageUtil().init();
    HttpUtils.init(baseUrl: Constant.serverApiUrl);

    //微信sdk初始化
    // await WeChatKit().registerWeChatApi(
    //   weChatAppId,
    //   universalLink: universalLink,
    // );

    //阿里云推送初始化
    //AliPushKit().initAliPush();

    // 读取设备第一次打开
    isFirstOpen = StorageUtil().getBool(Constant.storageDeviceFirstOpenKey);
    isFirstOpen ??= true;

    var _token = StorageUtil().getJSON(Constant.storageTokenKey);
    if (!isBlank(_token)) {
      isOfflineLogin = false;
    }

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }


  }

  // 保存用户已打开APP
  static saveAlreadyOpen() {
    StorageUtil().putBool(Constant.storageDeviceFirstOpenKey, false);
  }

  // 保存token
  static saveUserToken(String token) async {
    StorageUtil().putJSON(Constant.storageTokenKey, token);
    isOfflineLogin = isBlank(token);
  }

  static String getUserToken() {
    return StorageUtil().getJSON(Constant.storageTokenKey) ?? '';
  }

  // 保存userId
  static saveUserId(String useId) async {
    StorageUtil().putJSON(Constant.storageUserIdKey, useId);
  }

  // 获取userId
  static String getUserId() {
    return StorageUtil().getJSON(Constant.storageUserIdKey) ?? '';
  }

  static Future<bool>? saveIsFirst(bool isFirst) {
    return StorageUtil().putBool(Constant.storageDeviceFirstLoginKey, isFirst);
  }

  static bool? getIsFirst() {
    return StorageUtil().getBool(Constant.storageDeviceFirstLoginKey);
  }

  static saveAgree(bool value) {
    StorageUtil().putBool(Constant.storageDeviceAgreeKey, value);
  }

  static bool getAgree() {
    return StorageUtil().getBool(Constant.storageDeviceAgreeKey);
  }

  static DateTime? getNotificationDateTime() {
    final data = StorageUtil().getJSON(Constant.notificationDateTime);
    return DateTime.tryParse(data.toString());
  }

  static Future<void> setNotificationDateTime(DateTime date) {
    return StorageUtil().putJSON(Constant.notificationDateTime, date.toString());
  }

  // 保存设备aliPushDeviceId
  // static saveAliPushDeviceId(String id) async {
  //   StorageUtil().putJSON(Constant.aliPushDeviceIdKey, id);
  // }

  // 获取设备aliPushDeviceId
  // static Future<String> getAliPushDeviceId() async {
  //   String? aliPushDeviceId = StorageUtil().getJSON(aliPushDeviceIdKey);
  //   if (aliPushDeviceId == null || aliPushDeviceId.isEmpty) {
  //     aliPushDeviceId = await AliPushKit().getAliPushDeviceId();
  //     saveAliPushDeviceId(aliPushDeviceId ?? '');
  //   }
  //   return aliPushDeviceId ?? '';
  // }

  ///用户退出
  static void logout() {
    saveUserToken('');
    Get.offAllNamed(
     'login',
      arguments: {'canBack': false},
    );
  }
}
