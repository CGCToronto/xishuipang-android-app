import 'package:flutter/material.dart';
import 'dart:async';
import 'package:xishuipang_android/Modal_Service/Menu.dart';
import 'package:xishuipang_android/Modal_Service/VolumeList.dart';
import 'package:xishuipang_android/UI/MainMenu/MainUI.dart';

//加载页面
class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
}

class _LoadingState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
    //在加载页面停顿3秒
    new Future.delayed(Duration(seconds: 3), ()async {
      print("启动溪水旁app....");
      Menu menu = await _InitialAll();
      var route = new MaterialPageRoute(
        builder: (BuildContext context) =>
        new MainPart(m: menu),
      );
      Navigator.of(context).push(route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //加载图片
    Image.asset("assets/images/banner.jpg", height: double.infinity,
        width: double.infinity, fit: BoxFit.cover),

      //加载文字
        Center(child:Material(
            type: MaterialType.transparency,
            child: Container(
                child: Text("溪水旁杂志\n\n"+"是由多伦多华人福音堂的弟兄姐妹们\n\n"+"编辑而成的属灵杂志",
                  style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),)
            )),)


        ],

    );
  }

  Future<Menu>_InitialAll()async{
    int index = (await IssueVolumeList().fetchVolumeList())[0];
    Menu m = await Menu().fetchMenu(index.toString(), "simplified");
    return m;
  }

}