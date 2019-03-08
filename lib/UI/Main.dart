import 'package:flutter/material.dart';
import 'package:xishuipang_android/UI/AritcleMenu/ArticleUI.dart';
import 'package:xishuipang_android/UI/IssueMenu/IssueUI.dart';
import 'package:xishuipang_android/UI/MainMenu/MainUI.dart';
import 'package:xishuipang_android/UI/SearchMenu/SearchUI.dart';
import 'package:xishuipang_android/UI/LoadingMenu/Loadingpage.dart';


//应用程序入口
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: '溪水旁',
  //自定义主题
  theme: mDefaultTheme,
  //添加路由表
  routes: <String, WidgetBuilder>{
    "MainMenu": (BuildContext context) => new MainPart(),
    "ArticleMenu": (BuildContext context) => new ArticleUI(),
    "IssueMenu":(BuildContext context) => new IssueUI(),
    "SearchMenu":(BuildContext context) => new SearchUI(),
  },
  //指定首页 默认为加载页面
  home: new LoadingPage(),
));

//自定义主题 绿色小清新风格
final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.green,
);










