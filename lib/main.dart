import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'app/routes/app_pages.dart';
import 'common/global.dart';
import 'common/utils/logger.dart';
import 'common/utils/statusbar_kit.dart';
import 'generated/locales.g.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() async {
  await initServices();
  StatusBarKit.setPortrait().then((_) {
    runApp(
      ScreenUtilInit(
        designSize: const Size(390, 844), // iPhone 13尺寸
        builder: ([BuildContext? _, __]) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Novel",
            // 日志
            enableLog: true,
            logWriterCallback: Logger.write,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            translationsKeys: AppTranslation.translations,
            locale: const Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
            fallbackLocale: const Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
            builder: (context, widget) {
              return MediaQuery(
                ///设置文字大小不随系统设置改变
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: FlutterEasyLoading(child: widget),
              );
            },
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              //一定要配置,否则iphone手机长按编辑框有白屏卡着的bug出现
            ],
          );
        },
      ),
    );
  });


}

Future<void> initServices() async {
  debugPrint('starting services ...');
  await Global.init();
  debugPrint('All services started...');
}
