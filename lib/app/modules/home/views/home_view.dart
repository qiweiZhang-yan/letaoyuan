import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:letaoyuan_app/common/values/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        body: IndexedStack(
          children: <Widget>[
            BookshelfScene(),
            HomeScene(),
            MeScene(),
          ],
          index: _.tabIndex,
        ),
        bottomNavigationBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          activeColor: AppColors.primaryBackground,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '书架'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '书城'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '我的'),
          ],
          currentIndex: _.tabIndex,
          onTap: (index) {
            _.tabIndex = index;
            _.update();
          },
        ),
      );
    });
  }
}

class BookshelfScene extends StatelessWidget {
  const BookshelfScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('首页'),);
  }
}
class HomeScene extends StatelessWidget {
  const HomeScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('首页'));
  }
}

class MeScene extends StatelessWidget {
  const MeScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('首页'));
  }
}