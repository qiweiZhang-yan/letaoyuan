import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/common_widget/loading_widget.dart';
import '../controllers/bookshelf_scene_controller.dart';

class BookshelfSceneView extends GetView<BookshelfSceneController> {
  const BookshelfSceneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
    GetBuilder<BookshelfSceneController>(builder: (_) {
      return Container(
        height: ScreenUtil().screenHeight-ScreenUtil().bottomBarHeight,
        width:ScreenUtil().screenWidth ,
        child: SmartRefresher(
          controller: _.refreshController,
          onRefresh: _.onRefresh,
          onLoading: _.onLoading,
          enablePullUp: true,
          enablePullDown: true,
          child: _.items.isEmpty
              ? const LoadingWidget(stop: false,)
              : CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return Text(_.items[index]);
                  },
                  childCount: _.items.length,
                ),
              ),
            ],
          ),
        ).expand(),
      );});
  }
}
