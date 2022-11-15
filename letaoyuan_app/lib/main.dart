import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'app/routes/app_pages.dart';
import 'common/global.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'common/utils/logger.dart';
import 'common/utils/statusbar_kit.dart';
import 'common/widget/common_widget/loading_widget.dart';
import 'generated/locales.g.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await initServices();
  StatusBarKit.setPortrait().then((_) {
    runApp(
      ScreenUtilInit(
        designSize: const Size(390, 844), // iPhone 13尺寸
        builder: ([BuildContext? _, __]) {
          return RefreshConfiguration(
            headerBuilder: () => ClassicHeader(
                idleText: "",
                completeText: "",
                releaseText: "",
                refreshingText: "",
                idleIcon: refreshIcon(),
                completeIcon: refreshIcon(),
                releaseIcon: refreshIcon(),
                refreshingIcon: refreshIcon()),
            footerBuilder: () => const ClassicFooter(
              height: 0,
              noDataText: "",
            ),
            headerTriggerDistance: 80.0,        // 头部触发刷新的越界距离
            springDescription:SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // 自定义回弹动画,三个属性值意义请查询flutter api
            maxOverScrollExtent :100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
            maxUnderScrollExtent:100, // 底部最大可以拖动的范围
            enableScrollWhenRefreshCompleted: true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
            enableLoadingWhenFailed : true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
            hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
            enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Novel",
              // 日志
              enableLog: true,
              logWriterCallback: Logger.write,
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              translationsKeys: AppTranslation.translations,
              locale: const Locale('zh', 'HK'),
              // 将会按照此处指定的语言翻译
              fallbackLocale: const Locale('en', 'US'),
              // 添加一个回调语言选项，以备上面指定的语言翻译不存在
              builder: (context, widget) {
                return MediaQuery(
                  ///设置文字大小不随系统设置改变
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: FlutterEasyLoading(child: widget),
                );
              },
              localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                // this line is important
                RefreshLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],

            ),
          );
        },
      ),
    );
  });
}

refreshIcon() {
  return LoadingWidget(stop: false,);
}

Future<void> initServices() async {
  debugPrint('starting services ...');
  await Global.init();
  debugPrint('All services started...');
}
