import 'package:flutter/material.dart';
import 'package:xishuipang_android/UI/AritcleMenu/ArticleUI.dart';
import 'package:xishuipang_android/UI/MainMenu/MainUI.dart';
import 'package:xishuipang_android/UI/LoadingMenu/Loadingpage.dart';


//应用程序入口
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: '溪水旁',
  //自定义主题
  theme: new ThemeData(
    primaryColor: Colors.black,
  ),
  //添加路由表
  routes: <String, WidgetBuilder>{
    "MainMenu": (BuildContext context) => new MainPart(),
    "ArticleMenu": (BuildContext context) => new ArticleUI(),

  },
  //指定首页 默认为加载页面
  home: new LoadingPage(),
));












