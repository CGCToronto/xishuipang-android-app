import 'package:flutter/material.dart';
import 'package:xishuipang_android/UI/AritcleMenu/ArticleUI.dart';
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:xishuipang_android/UI/MainMenu/MainPart.dart';
import 'package:xishuipang_android/UI/MainMenu/testPageSelector.dart';
void main() {
  //debugPaintSizeEnabled = false;
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.portraitUp,
//    ]);
    return new MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      title: '溪水旁',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
        home: new MyHomePage()


        );

  }
}

class MyHomePage extends StatefulWidget {
  @override
  MainPart createState() {
    return new MainPart();
  }

//  @override
//  ArticleUI createState() {
//    return new ArticleUI();
//  }






}


