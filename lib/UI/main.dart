import 'package:flutter/material.dart';
import 'package:xishuipang_android/UI/AritcleMenu//ArticleUI.dart';
import 'package:flutter/services.dart';
import 'package:xishuipang_android/UI/AritcleMenu/test.dart';
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:xishuipang_android/UI/AritcleMenu/silver_test.dart';
import 'package:xishuipang_android/UI/MainMenu/MainPart.dart';
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
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      title: '溪水旁',
      theme: new ThemeData(
        primaryColor: Colors.black,
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
//  sliver_test createState() {
//    return new sliver_test();
//  }



}


